#!/bin/bash
# =============================================================================
# Kubernetes Worker Node Setup Script
# Tested on: Ubuntu 22.04 LTS | K8s v1.29.6 | Containerd v1.7.14
# Invoked by: Terraform null_resource.worker_setup (worker-nodes.tf)
# The kubeadm join command is uploaded separately as join-command.sh
# =============================================================================
set -euo pipefail

# ── Colour helpers ────────────────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC}  $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC}  $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; exit 1; }

[[ $EUID -ne 0 ]] && error "Run this script as root or via sudo."

NODE_IP=$(hostname -I | awk '{print $1}')
info "🚀 Starting Kubernetes Worker Node setup..."
info "Worker node IP: ${NODE_IP}"

# =============================================================================
# 1. DISABLE SWAP
# =============================================================================
info "Disabling swap..."
swapoff -a
sed -i -E '/\bswap\b/s/^([^#].*)$/#\1/' /etc/fstab

# =============================================================================
# 2. KERNEL MODULES
# =============================================================================
info "Loading kernel modules..."
cat >/etc/modules-load.d/k8s.conf <<EOF
overlay
br_netfilter
EOF
modprobe overlay
modprobe br_netfilter

# =============================================================================
# 3. SYSCTL PARAMS
# =============================================================================
info "Applying sysctl parameters..."
cat >/etc/sysctl.d/k8s.conf <<EOF
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF
sysctl --system

# =============================================================================
# 4. INSTALL CONTAINERD
# =============================================================================
info "Installing containerd v1.7.14..."
CONTAINERD_VERSION="1.7.14"
curl -fsSL -o /tmp/containerd.tar.gz \
  "https://github.com/containerd/containerd/releases/download/v${CONTAINERD_VERSION}/containerd-${CONTAINERD_VERSION}-linux-amd64.tar.gz"
tar Cxzf /usr/local /tmp/containerd.tar.gz

mkdir -p /usr/local/lib/systemd/system
curl -fsSL -o /usr/local/lib/systemd/system/containerd.service \
  https://raw.githubusercontent.com/containerd/containerd/main/containerd.service

mkdir -p /etc/containerd
containerd config default >/etc/containerd/config.toml
sed -i 's/SystemdCgroup = false/SystemdCgroup = true/' /etc/containerd/config.toml

systemctl daemon-reload
systemctl enable --now containerd
info "containerd started."

# =============================================================================
# 5. INSTALL RUNC
# =============================================================================
info "Installing runc v1.1.12..."
curl -fsSL -o /tmp/runc.amd64 \
  https://github.com/opencontainers/runc/releases/download/v1.1.12/runc.amd64
install -m 755 /tmp/runc.amd64 /usr/local/sbin/runc

# =============================================================================
# 6. INSTALL CNI PLUGINS
# =============================================================================
info "Installing CNI plugins v1.5.0..."
CNI_VERSION="1.5.0"
curl -fsSL -o /tmp/cni-plugins.tgz \
  "https://github.com/containernetworking/plugins/releases/download/v${CNI_VERSION}/cni-plugins-linux-amd64-v${CNI_VERSION}.tgz"
mkdir -p /opt/cni/bin
tar Cxzf /opt/cni/bin /tmp/cni-plugins.tgz

# =============================================================================
# 7. INSTALL KUBERNETES COMPONENTS
# BUG FIX: Workers only need kubelet + kubeadm.
# kubectl is not required on worker nodes.
# =============================================================================
info "Installing kubelet and kubeadm v1.29.6..."
apt-get update -qq
apt-get install -y -qq apt-transport-https ca-certificates curl gpg

mkdir -p /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key \
  | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' \
  >/etc/apt/sources.list.d/kubernetes.list

apt-get update -qq
apt-get install -y \
  kubelet=1.29.6-1.1 \
  kubeadm=1.29.6-1.1 \
  --allow-downgrades --allow-change-held-packages
apt-mark hold kubelet kubeadm

# =============================================================================
# 8. CONFIGURE CRICTL
# BUG FIX: Only runtime-endpoint was set. image-endpoint is also required
# to suppress warnings and support full crictl functionality.
# =============================================================================
info "Configuring crictl..."
cat >/etc/crictl.yaml <<EOF
runtime-endpoint: unix:///var/run/containerd/containerd.sock
image-endpoint: unix:///var/run/containerd/containerd.sock
timeout: 10
debug: false
EOF

# =============================================================================
# 9. CONFIGURE KUBELET NODE IP
# BUG FIX: Without this, kubelet may register with the wrong IP on
# EC2 instances that have both private and public NICs.
# =============================================================================
info "Pinning kubelet node IP to ${NODE_IP}..."
cat >/etc/default/kubelet <<EOF
KUBELET_EXTRA_ARGS=--node-ip=${NODE_IP}
EOF
systemctl daemon-reload

# =============================================================================
# Done — Terraform will upload and execute join-command.sh separately
# =============================================================================
echo ""
echo "==========================================="
echo " ✅ Worker Node Pre-flight Complete"
echo "==========================================="
echo ""
info "kubelet and kubeadm installed. Waiting for join command from Terraform..."

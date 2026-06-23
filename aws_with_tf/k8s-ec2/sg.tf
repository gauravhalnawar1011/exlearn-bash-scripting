# sg.tf

resource "aws_security_group" "kubeadm_cluster" {

name = "${var.environment}-kubeadm-sg"

description = "Kubeadm Cluster Security Group"

vpc_id = aws_vpc.main.id

tags = {


Name = "${var.environment}-kubeadm-sg"

Environment = var.environment

ManagedBy = "Terraform"


}
}

#################################################

# SSH

#################################################

resource "aws_vpc_security_group_ingress_rule" "ssh" {

security_group_id = aws_security_group.kubeadm_cluster.id

cidr_ipv4 = "0.0.0.0/0"

from_port = 22

to_port = 22

ip_protocol = "tcp"

description = "SSH Access"
}

#################################################

# KUBERNETES API SERVER

#################################################

resource "aws_vpc_security_group_ingress_rule" "k8s_api" {

security_group_id = aws_security_group.kubeadm_cluster.id

referenced_security_group_id = aws_security_group.kubeadm_cluster.id

from_port = 6443

to_port = 6443

ip_protocol = "tcp"

description = "Kubernetes API"
}

#################################################

# ETCD

#################################################

resource "aws_vpc_security_group_ingress_rule" "etcd" {

security_group_id = aws_security_group.kubeadm_cluster.id

referenced_security_group_id = aws_security_group.kubeadm_cluster.id

from_port = 2379

to_port = 2380

ip_protocol = "tcp"

description = "etcd"
}

#################################################

# KUBELET

#################################################

resource "aws_vpc_security_group_ingress_rule" "kubelet" {

security_group_id = aws_security_group.kubeadm_cluster.id

referenced_security_group_id = aws_security_group.kubeadm_cluster.id

from_port = 10250

to_port = 10250

ip_protocol = "tcp"

description = "Kubelet"
}

#################################################

# CONTROLLER MANAGER

#################################################

resource "aws_vpc_security_group_ingress_rule" "controller_manager" {

security_group_id = aws_security_group.kubeadm_cluster.id

referenced_security_group_id = aws_security_group.kubeadm_cluster.id

from_port = 10257

to_port = 10257

ip_protocol = "tcp"

description = "Controller Manager"
}

#################################################

# SCHEDULER

#################################################

resource "aws_vpc_security_group_ingress_rule" "scheduler" {

security_group_id = aws_security_group.kubeadm_cluster.id

referenced_security_group_id = aws_security_group.kubeadm_cluster.id

from_port = 10259

to_port = 10259

ip_protocol = "tcp"

description = "Scheduler"
}

#################################################

# NODEPORT SERVICES

#################################################

resource "aws_vpc_security_group_ingress_rule" "nodeport" {

security_group_id = aws_security_group.kubeadm_cluster.id

cidr_ipv4 = "0.0.0.0/0"

from_port = 30000

to_port = 32767

ip_protocol = "tcp"

description = "NodePort Services"
}

#################################################

# CALICO VXLAN

#################################################

resource "aws_vpc_security_group_ingress_rule" "calico_vxlan" {

security_group_id = aws_security_group.kubeadm_cluster.id

referenced_security_group_id = aws_security_group.kubeadm_cluster.id

from_port = 4789

to_port = 4789

ip_protocol = "udp"

description = "Calico VXLAN"
}

#################################################

# BGP

#################################################

resource "aws_vpc_security_group_ingress_rule" "bgp" {

security_group_id = aws_security_group.kubeadm_cluster.id

referenced_security_group_id = aws_security_group.kubeadm_cluster.id

from_port = 179

to_port = 179

ip_protocol = "tcp"

description = "Calico BGP"
}

#################################################

# ICMP

#################################################

resource "aws_vpc_security_group_ingress_rule" "icmp" {

security_group_id = aws_security_group.kubeadm_cluster.id

cidr_ipv4 = aws_vpc.main.cidr_block

from_port = -1

to_port = -1

ip_protocol = "icmp"

description = "Ping"
}

#################################################

# OUTBOUND ALL

#################################################

resource "aws_vpc_security_group_egress_rule" "all_outbound" {

security_group_id = aws_security_group.kubeadm_cluster.id

cidr_ipv4 = "0.0.0.0/0"

ip_protocol = "-1"

description = "All Outbound Traffic"
}

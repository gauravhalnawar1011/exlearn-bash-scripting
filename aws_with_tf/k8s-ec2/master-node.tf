resource "aws_instance" "control_plane" {

ami                         = var.ami_id
instance_type               = var.master_instance_type
subnet_id                   = aws_subnet.public.id
key_name                    = var.key_name
associate_public_ip_address = true

vpc_security_group_ids = [
aws_security_group.kubeadm_cluster.id
]

tags = {
Name        = "control-plane"
Environment = var.environment
}
}

resource "null_resource" "control_plane_setup" {

depends_on = [
aws_instance.control_plane
]

connection {
type        = "ssh"
user        = "ubuntu"
host        = aws_instance.control_plane.public_ip
private_key = file(var.private_key_path)
}

provisioner "file" {
source      = "./scripts/control-plane-cmd.sh"
destination = "/home/ubuntu/control-plane-cmd.sh"
}

provisioner "remote-exec" {
inline = [
"chmod +x /home/ubuntu/control-plane-cmd.sh",
"sudo bash /home/ubuntu/control-plane-cmd.sh",


  # Wait for API Server to become available
  "sleep 30",

  # Generate and save join command
  "sudo kubeadm token create --print-join-command > /home/ubuntu/join-command.sh",

  # Verify file exists
  "cat /home/ubuntu/join-command.sh"
]


}

provisioner "local-exec" {
command = "ssh -o StrictHostKeyChecking=no -i ${var.private_key_path} ubuntu@${aws_instance.control_plane.public_ip} 'cat /home/ubuntu/join-command.sh' > join-command.sh"
}

}

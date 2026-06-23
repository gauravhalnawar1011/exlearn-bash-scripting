output "join_command" {
  value = "ssh ubuntu@${aws_instance.control_plane.public_ip} 'cat /tmp/join-command.sh'"
}
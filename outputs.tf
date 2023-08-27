output "tf_webserver_ip" {
  value = aws_instance.tf_webserver.public_ip
}
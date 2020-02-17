output "public_ip" {
    value = "${aws_instance.myinst.public_ip}"
}

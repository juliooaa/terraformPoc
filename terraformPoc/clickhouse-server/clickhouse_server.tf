resource "aws_instance" "clickhouse-dev" {
    ami = var.ami-id
    instance_type = var.instance-type
    key_name = var.key-pair
    vpc_security_group_ids = ["${aws_security_group.allow-everything.id}"]

    root_block_device {
        volume_type = "gp2"
        volume_size = 20
    }

    user_data = "${file("clickhouse-server/sh/clickhouse.sh")}"

    tags = {
        Name = var.name
    }
}







resource "aws_security_group" "allow-everything" {
    name = "allow-everything"
    description = "Will allow every access"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 9000
        to_port = 9000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}
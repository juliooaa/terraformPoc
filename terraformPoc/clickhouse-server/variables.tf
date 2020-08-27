variable "ami-id" {
    type = string
}
variable "instance-type" {
    default = "t2.micro"
    type = string
}

variable "key-pair" {
    type = string
}

variable "name" {
    type = string
}
variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default     = "t3.micro"
}

variable "ami" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0c02fb55956c7d316"
}

variable "bucket_name" {
  default     = "yuga-unique-bucket-name"
}

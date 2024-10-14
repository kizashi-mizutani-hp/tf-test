# VPCIDを受け取るための変数
variable "vpc_id" {
  description = "The VPC ID for the ALB"
  type        = string
}

# サブネットIDを受け取るための変数
variable "public_subnet_1a_id" {
  description = "The subnet ID for the public of 1a"
  type        = string
}

# サブネットIDを受け取るための変数
variable "public_subnet_1c_id" {
  description = "The subnet ID for the public of 1c"
  type        = string
}

# サブネットIDを受け取るための変数
variable "private_subnet_id" {
  description = "The subnet ID for the private of 1a"
  type        = string
}

# セキュリティグループIDを受け取るための変数(EC2)
variable "ec2_sg" {
  description = "Security groups to attach to the EC2 instance"
  type        = list(string)
}

# セキュリティグループIDを受け取るための変数(bastion)
variable "bastion_sg" {
  description = "Security groups to attach to the bastion instance"
  type        = list(string)
}

# セキュリティグループIDを受け取るための変数(bastion)
variable "alb_sg" {
  description = "Security groups to attach to the ALB instance"
  type        = list(string)
}
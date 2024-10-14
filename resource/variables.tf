
/* ########################################

 外部から渡される値(入力)を定義する
 ./main.tfから値を受け取る

######################################## */

# VPCIDを受け取るための変数
variable "main_vpc" {
  description = "The VPC ID for the ALB"
  type        = string
}

# サブネットIDを受け取るための変数
variable "public_subnet_1a" {
  description = "The subnet ID for the public of 1a"
  type        = string
}

# サブネットIDを受け取るための変数
variable "public_subnet_1c" {
  description = "The subnet ID for the public of 1c"
  type        = string
}

# サブネットIDを受け取るための変数
variable "private_subnet_1a" {
  description = "The subnet ID for the private of 1a"
  type        = string
}

# サブネットIDを受け取るための変数
variable "private_subnet_1c" {
  description = "The subnet ID for the private of 1c"
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

# セキュリティグループIDを受け取るための変数(alb)
variable "alb_sg" {
  description = "Security groups to attach to the ALB instance"
  type        = list(string)
}

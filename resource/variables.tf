
/* ########################################

 外部から渡される値(入力)を定義する
 ./main.tfから値を受け取る

######################################## */


# CostCenterの変数を追加
variable "cost_center" {
  description = "Cost Center for resource tracking"
  type        = string
  default     = "12345"  # デフォルトのCost Center番号
}

# VPCIDを受け取るための変数
variable "main_vpc_id" {
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
variable "private_subnet_1a_id" {
  description = "The subnet ID for the private of 1a"
  type        = string
}

# サブネットIDを受け取るための変数
variable "private_subnet_1c_id" {
  description = "The subnet ID for the private of 1c"
  type        = string
}

# セキュリティグループIDを受け取るための変数(EC2)
variable "ec2_sg_id" {
  description = "Security groups to attach to the EC2 instance"
  type        = list(string)
}

# セキュリティグループIDを受け取るための変数(bastion)
variable "bastion_sg_id" {
  description = "Security groups to attach to the bastion instance"
  type        = list(string)
}

# セキュリティグループIDを受け取るための変数(alb)
variable "alb_sg_id" {
  description = "Security groups to attach to the ALB instance"
  type        = list(string)
}

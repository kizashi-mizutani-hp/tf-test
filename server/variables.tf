
# サブネットIDを受け取るための変数
variable "subnet_id" {
  description = "The subnet ID for the EC2 instance"
  type        = string
}

# セキュリティグループIDを受け取るための変数
variable "security_groups" {
  description = "Security groups to attach to the EC2 instance"
  type        = list(string)
}

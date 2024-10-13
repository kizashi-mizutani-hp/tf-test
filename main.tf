

module "network" {
  source = "./network"
}

module "server" {
  source = "./server"
  vpc_id = module.network.vpc_id
  private_subnet_id = module.network.private_subnet_1a_id
  ec2_sg = [module.network.security_group_ec2_sg_id]
  bastion_sg = [module.network.security_group_bastion_sg_id]
  alb_sg = [module.network.security_group_alb_sg_id]
}


# # 出力テスト
# output "server_private_subnet_id" {
#   value = module.server.private_subnet_id
# }

# output "server_ec2_sg" {
#   value = module.server.ec2_sg
# }

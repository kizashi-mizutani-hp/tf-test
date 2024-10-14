
module "network" {
  source = "./network"
}

module "server" {
  source = "./server"

  # networkモジュールのoutput.tfで定義された出力をserverモジュールに渡す
  main_vpc          = module.network.main_vpc
  public_subnet_1a  = module.network.public_subnet_1a
  public_subnet_1c  = module.network.public_subnet_1c
  private_subnet_1a = module.network.private_subnet_1a
  private_subnet_1c = module.network.private_subnet_1c

  # セキュリティグループのIDをserverモジュールに渡す
  ec2_sg            = [module.network.security_group_ec2_sg]
  bastion_sg        = [module.network.security_group_bastion_sg]
  alb_sg            = [module.network.security_group_alb_sg]
}

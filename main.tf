
module "network" {
  source = "./network"
}

module "resource" {
  source = "./resource"

  # networkモジュールのoutput.tfで定義された出力をresourceモジュールに渡す
  main_vpc          = module.network.main_vpc
  public_subnet_1a  = module.network.public_subnet_1a
  public_subnet_1c  = module.network.public_subnet_1c
  private_subnet_1a = module.network.private_subnet_1a
  private_subnet_1c = module.network.private_subnet_1c

  # セキュリティグループのIDをresourceモジュールに渡す
  ec2_sg            = [module.network.security_group_ec2_sg]
  bastion_sg        = [module.network.security_group_bastion_sg]
  alb_sg            = [module.network.security_group_alb_sg]
}

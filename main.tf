
module "network" {
  source = "./network"
}

module "resource" {
  source = "./resource"

  # networkモジュールのoutput.tfで定義された出力をresourceモジュールに渡す
  main_vpc_id          = module.network.main_vpc_id
  public_subnet_1a_id  = module.network.public_subnet_1a_id
  public_subnet_1c_id  = module.network.public_subnet_1c_id
  private_subnet_1a_id = module.network.private_subnet_1a_id
  private_subnet_1c_id = module.network.private_subnet_1c_id

  # セキュリティグループのIDをresourceモジュールに渡す
  ec2_sg_id            = [module.network.security_group_ec2_sg_id]
  alb_sg_id            = [module.network.security_group_alb_sg_id]
  bastion_sg_id        = [module.network.security_group_bastion_sg_id]
}

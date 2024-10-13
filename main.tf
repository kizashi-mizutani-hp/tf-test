

module "network" {
  source = "./network"
}

module "server" {
  source = "./server"
  subnet_id       = module.network.private_subnet_1a_id
  security_groups = [module.network.security_group_ec2_id]
}

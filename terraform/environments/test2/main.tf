module "human" {
  source = "../../modules/human"

  name = "test2-updaet"
}

output "name" {
  value = module.human.name
}

module "human" {
  source = "../../modules/human"

  name = "test"
}

output "name" {
  value = module.human.name
}

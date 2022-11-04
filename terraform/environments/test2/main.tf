module "human" {
  source = "../../modules/human"

  name = "test2"
}

output "name" {
  value = module.human.name
}

module "vpc" {
  source                  = "./modules/vpc"
  vpc_name                = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
}

module "gcs" {
  source        = "./modules/gcs-bucket"
  bucket_name   = var.bucket_name
  location      = var.location
  storage_class = var.storage_class
  environment   = var.environment
}

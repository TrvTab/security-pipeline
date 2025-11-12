resource "aws_s3_bucket" "foo-bucket" {
#same resource configuration as previous example, but acl set for public access.
  
  acl           = "public-read"
}
data "aws_caller_identity" "current" {}


resource "aws_efs_file_system" "sharedstore" {
  creation_token = var.efs["creation_token"]

  lifecycle_policy {
    transition_to_ia = var.efs["transition_to_ia"]
  }

  kms_key_id                      = var.efs["kms_key_id"]
  encrypted                       = false # false will fail checkov, true will passx
  performance_mode                = var.efs["performance_mode"]
  provisioned_throughput_in_mibps = var.efs["provisioned_throughput_in_mibps"]
  throughput_mode                 = var.efs["throughput_mode"]
}
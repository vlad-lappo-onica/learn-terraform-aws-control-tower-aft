module "aft" {
  source = "github.com/aws-ia/terraform-aws-control_tower_account_factory"
  ct_management_account_id    = var.ct_management_account_id
  log_archive_account_id      = var.log_archive_account_id
  audit_account_id            = var.audit_account_id
  aft_management_account_id   = var.aft_management_account_id
  ct_home_region              = var.ct_home_region
  tf_backend_secondary_region = var.tf_backend_secondary_region

  vcs_provider                                  = "github"
  account_request_repo_branch = var.vcs_branch_name
  global_customizations_repo_branch = var.vcs_branch_name
  account_customizations_repo_branch = var.vcs_branch_name
  account_provisioning_customizations_repo_branch = var.vcs_branch_name

  account_request_repo_name                     = "${var.github_username}/aft-account-request"
  account_provisioning_customizations_repo_name = "${var.github_username}/aft-account-provisioning-customizations"
  global_customizations_repo_name               = "${var.github_username}/aft-global-customizations"
  account_customizations_repo_name              = "${var.github_username}/aft-account-customizations"

  aft_feature_delete_default_vpcs_enabled = true
}

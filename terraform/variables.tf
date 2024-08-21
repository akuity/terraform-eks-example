variable "akp_org_name" {
  type        = string
  description = "Akuity Platform organization name."
  default     = "morey-tech"
}

variable "environment" {
  type        = string
  description = "environment name"
  default     = "dev"
}

variable "argocd_admin_password" {
  type        = string
  description = "The password to use for the `admin` Argo CD user."
  default     = "akuity-argocd"
}

variable "enable_git_ssh" {
  description = "Use git ssh to access all git repos using format git@github.com:<org>"
  type        = bool
  default     = false
}
variable "ssh_key_path" {
  description = "SSH key path for git access"
  type        = string
  default     = "~/.ssh/id_rsa"
}

variable "aws_vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}
variable "aws_kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.30"
}
variable "aws_kubernetes_name" {
  description = "Kubernetes name"
  type        = string
  default     = "akuity-terraform-eks-example"
}

variable "addons" {
  description = "Kubernetes addons"
  type        = any
  default = {
    enable_cert_manager     = true
    enable_external_secrets = true
    enable_kyverno          = false
  }
}

variable "enable_gitops_auto_bootstrap" {
  description = "Automatically deploy addons"
  type        = bool
  default     = true
}

variable "repo_credential_secrets" {
  description = "repo_credential_secrets"
  type        = any
  default     = {}
}

variable "tags" {
  description = "tags"
  type        = map(string)
  default     = {}
}

variable "gitops_repo_url" {
  description = "gitops repo url"
  type        = string
  default     = "https://github.com/akuity/terraform-eks-example"
}

variable "gitops_path" {
  description = "gitops path in repo"
  type        = string
  default     = "gitops/bootstrap"
}

variable "gitops_target_revision" {
  description = "gitops target revision of repo"
  type        = string
  default     = "HEAD"
}
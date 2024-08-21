resource "argocd_application" "bootstrap_addons" {
  metadata {
    name      = "addons"
    namespace = "argocd"
    labels = {
      cluster = "in-cluster"
    }
  }
  cascade = true
  wait    = true
  spec {
    project = "default"
    destination {
      name      = "in-cluster"
      namespace = "argocd"
    }
    source {
      repo_url        = var.gitops_repo_url
      path            = var.gitops_path
      target_revision = var.gitops_target_revision
      directory {
        recurse = true
        exclude = "exclude/*"
      }
    }
    sync_policy {
      automated {
        prune     = true
        self_heal = true
      }
    }
  }
}
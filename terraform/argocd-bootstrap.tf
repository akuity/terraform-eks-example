# If the Argo CD instance was created during the apply, the API
# may not be available yet, resulting in a 503 error.
resource "time_sleep" "this" {
  create_duration = "75s"  # Avg time-to-healthy for an instance.
  depends_on = [ akp_instance.argocd ]
}

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

  depends_on = [ time_sleep.this ]
}
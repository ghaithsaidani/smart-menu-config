resource "azurerm_role_assignment" "acr_aks_role_assignement" {
//principal_id                     = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  principal_id                     = var.principal_id
  role_definition_name             = "AcrPull"
  scope                            = var.scope
  //skip_service_principal_aad_check = true
  depends_on = [ var.aks_cluster ]
}

/* resource "azuread_application" "aks_sp" {
  display_name = "sp-aks"
}

resource "azuread_service_principal" "aks_sp" {
  id = azuread_application.aks_sp.id
  client_id = azuread_application.aks_sp.client_id
  app_role_assignment_required = false
}


resource "azuread_service_principal_password" "aks_sp" {
  service_principal_id = azuread_application.aks_sp.id
  value                = random_string.aks_sp_password.result
  lifecycle {
    ignore_changes = [
      value,
      end_date_relative
    ]
  }
}

resource "azuread_application_password" "aks_sp" {
  application_id = azuread_application.aks_sp.id
  value                 = random_string.aks_sp_secret.result
  lifecycle {
    ignore_changes = [
      value,
      end_date_relative
    ]
  }
} */
/* resource "azuread_application" "ad_app" {
  display_name = var.ad-app-name
}

resource "azuread_service_principal" "ad_service_pr" {
  client_id = azuread_application.ad_app.client_id
}

resource "azuread_app_role_assignment" "jenkins-vm-assignement" {
  app_role_id = "b24988ac-6180-42a0-ab88-20f7382dd24c"
  principal_object_id    = azuread_service_principal.ad_service_pr.id
  resource_object_id = azuread_application.ad_app.id
} */
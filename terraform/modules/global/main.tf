resource "azurerm_role_assignment" "acr_aks_role_assignement" {
  principal_id                     = var.principal_id
  role_definition_name             = "AcrPull"
  scope                            = var.scope
  skip_service_principal_aad_check = true
}

/* resource "azuread_application" "aks_sp" {
  display_name = "sp-aks"
}

resource "azuread_service_principal" "aks_sp" {
  client_id = azuread_application.aks_sp.client_id
  app_role_assignment_required = false
}


resource "azuread_service_principal_password" "aks_sp" {
  service_principal_id = azuread_application.aks_sp.client_id
  lifecycle {
    ignore_changes = [
      value,
    ]
  }
}

resource "azuread_application_password" "aks_sp" {
  application_id = azuread_application.aks_sp.id
  lifecycle {
    ignore_changes = [
      value,
    ]
  }
} */
resource "azurerm_resource_group" "hello-world-rg" {
    name     = "hello-world-rg"
    location = "West Europe"
}

resource "azurerm_service_plan" "hello-world-asp" {
    name                = "hello-world-asp"
    location            = azurerm_resource_group.hello-world-rg.location
    resource_group_name = azurerm_resource_group.hello-world-rg.name
    sku_name            = "F1"
    os_type             = "Linux"
}

resource "azurerm_linux_web_app" "hello-world-jh-as" {
    name                = "hello-world-jh-as"
    location            = azurerm_resource_group.hello-world-rg.location
    resource_group_name = azurerm_resource_group.hello-world-rg.name
    service_plan_id     = azurerm_service_plan.hello-world-asp.id

    site_config {
        always_on = false
        application_stack {
            python_version = "3.10"
        }
    }
}

resource "azurerm_app_service_source_control" "hello-world-jh-as" {
  app_id                = azurerm_linux_web_app.hello-world-jh-as.id
  repo_url            = "https://github.com/janhaans/hello-world-azure-web-app"
  branch              = "main"
}


output "web-app-url" {
    value = azurerm_linux_web_app.hello-world-jh-as.default_hostname
}
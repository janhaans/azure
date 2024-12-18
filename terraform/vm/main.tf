resource "azurerm_resource_group" "hello-world-rg" {
    name     = "hello-world-rg"
    location = "West Europe"
}

resource "azurerm_virtual_network" "hello-world-vnet" {
    name                = "hello-world-vnet"
    address_space       = ["10.0.0.0/16"]
    location            = azurerm_resource_group.hello-world-rg.location
    resource_group_name = azurerm_resource_group.hello-world-rg.name
}

resource "azurerm_subnet" "hello-world-subnet" {
    name                 = "hello-world-subnet"
    resource_group_name  = azurerm_resource_group.hello-world-rg.name
    virtual_network_name = azurerm_virtual_network.hello-world-vnet.name
    address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "hello-world-public-ip" {
    name                = "hello-world-public-ip"
    location            = azurerm_resource_group.hello-world-rg.location
    resource_group_name = azurerm_resource_group.hello-world-rg.name
    allocation_method   = "Dynamic"
    sku = "Basic"
}

resource "azurerm_network_interface" "hello-world-nic" {
    name                = "hello-world-nic"
    location            = azurerm_resource_group.hello-world-rg.location
    resource_group_name = azurerm_resource_group.hello-world-rg.name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.hello-world-subnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.hello-world-public-ip.id
    }
}

resource "azurerm_linux_virtual_machine" "hello-world-vm" {
    name                  = "hello-world-vm"
    location              = azurerm_resource_group.hello-world-rg.location
    resource_group_name   = azurerm_resource_group.hello-world-rg.name
    network_interface_ids = [azurerm_network_interface.hello-world-nic.id]
    size                  = "Standard_B1ls"
    admin_username        = "adminuser"

    admin_ssh_key {
        username   = "adminuser"
        public_key = file("~/.ssh/id_ed25519.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-confidential-vm-jammy"
        sku       = "22_04-lts-cvm"
        version   = "latest"
    }
}

output "hello_world_vm_id" {
    value = azurerm_linux_virtual_machine.hello-world-vm.id
}

output "hello_world_public_ip" {
    value = azurerm_public_ip.hello-world-public-ip.ip_address
}

output "hello_world_private_ip" {
    value = azurerm_network_interface.hello-world-nic.private_ip_address
}
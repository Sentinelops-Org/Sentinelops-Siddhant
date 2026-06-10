resource "azurerm_public_ip" "sentinelops-pip" {
  name                = "pip-${var.virtual_machine_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_network_security_group" "sentinelops-nsg" {
  name                = "${var.virtual_machine_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "49.200.158.22/32"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "sentinelops-nic" {
  name                = "${var.virtual_machine_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${var.virtual_machine_name}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.sentinelops-pip.id
  }
}

resource "azurerm_network_interface_security_group_association" "sentinelops-nic-nsg-association" {
  network_interface_id      = azurerm_network_interface.sentinelops-nic.id
  network_security_group_id = azurerm_network_security_group.sentinelops-nsg.id
}

resource "azurerm_linux_virtual_machine" "sentinelops-vm" {
  name                = var.virtual_machine_name
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.sentinelops-nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  tags = {
    environment = "dev"
    project     = "sentinelops"
    owner       = "siddhant"
    createdby   = "terraform"
  }
}
export ARM_SUBSCRIPTION_ID="8b521544-a3c1-493d-ad92-9ee6c75a609c"
export TF_VAR_base_adress_space="10.39.0.0/22"

export TF_VAR_env_name="dev"
export TF_VAR_application_name="network"

export BACKEND_RESOURCE_GROUP="rg-tfstate-dev"
export BACKEND_STORAGE_ACCOUNT="st3ue6ub01on"
export BACKEND_CONTAINER="tfstate"
export BACKEND_KEY=$TF_VAR_application_name-$TF_VAR_env_name

terraform init \
    -backend-config="resource_group_name=${BACKEND_RESOURCE_GROUP}" \
    -backend-config="storage_account_name=${BACKEND_STORAGE_ACCOUNT}" \
    -backend-config="container_name=${BACKEND_CONTAINER}" \
    -backend-config="key=${BACKEND_KEY}"

# MSYS_NO_PATHCONV=1 terraform import azurerm_resource_group.main "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-network-dev"
# MSYS_NO_PATHCONV=1 terraform import azurerm_virtual_network.main "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-network-dev/providers/Microsoft.Network/virtualNetworks/vnet-network-dev"
# MSYS_NO_PATHCONV=1 terraform import azurerm_subnet.alpha "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-network-dev/providers/Microsoft.Network/virtualNetworks/vnet-network-dev/subnets/snet-alpha"
# MSYS_NO_PATHCONV=1 terraform import azurerm_subnet.rajaa "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-network-dev/providers/Microsoft.Network/virtualNetworks/vnet-network-dev/subnets/snet-rajaa"
# MSYS_NO_PATHCONV=1 terraform import azurerm_subnet.delta "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-network-dev/providers/Microsoft.Network/virtualNetworks/vnet-network-dev/subnets/snet-delta"
# MSYS_NO_PATHCONV=1 terraform import azurerm_subnet.bravo "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-network-dev/providers/Microsoft.Network/virtualNetworks/vnet-network-dev/subnets/snet-bravo"
# MSYS_NO_PATHCONV=1 terraform import azurerm_subnet_network_security_group_association.alpha_remote_access "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-network-dev/providers/Microsoft.Network/virtualNetworks/vnet-network-dev/subnets/snet-alpha"
# MSYS_NO_PATHCONV=1 terraform import azurerm_network_security_group.remote_access "/subscriptions/8b521544-a3c1-493d-ad92-9ee6c75a609c/resourceGroups/rg-network-dev/providers/Microsoft.Network/networkSecurityGroups/nsg-network-dev-remote-access"

terraform $*
# rm -rf .terraform



# Project Constants
export REGION=${REGION:-"us-central1"}
export LOCATION="us-central1"
export ZONE="us-central1-f"
export TERRAFORM_STATE_BUCKET="terraform-state"
export DOMAINS_STEVEREAVER='["stevereaver.com","www.stevereaver.com"]'
export DOMAINS_RVRMEDIA='["rvrmedia.com","www.rvrmedia.com"]'
export DOMAINS_HUGO='["stephenbancroft.id.au"]'
export NETWORK="default"

export INSTANCE_GROUP="wordpress-instance-group"
export INSTANCE="projects/stevereaver-com/zones/us-central1-f/instances/openlitespeed-wordpress-1-vm"

# IAP web Access User List
export IAP_USERS='["user:stevereaver@gmail.com"]'

# LB Constants
export MIN_PORTS_PER_VM="10000"
export MAX_PORTS_PER_VM="63000"


# Terraform Mappings
export TF_VAR_project_id=${PROJECT_ID}
export TF_VAR_region=${REGION}
export TF_VAR_location=${LOCATION}
export TF_VAR_zone=${ZONE}
export TF_VAR_instance_group=${INSTANCE_GROUP}
export TF_VAR_instance=${INSTANCE}
export TF_VAR_domains_stevereaver=${DOMAINS_STEVEREAVER}
export TF_VAR_domains_rvrmedia=${DOMAINS_RVRMEDIA}
export TF_VAR_domains_hugo=${DOMAINS_HUGO}
export TF_VAR_iap_users=${IAP_USERS}
export TF_VAR_network=${NETWORK}
export TF_VAR_min_ports_per_vm=${MIN_PORTS_PER_VM}
export TF_VAR_max_ports_per_vm=${MAX_PORTS_PER_VM}


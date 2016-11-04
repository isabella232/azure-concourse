#!/bin/bash
set -e


if [ $arg_wipe == "wipe" ];
        then
                echo "Wiping Environment...."
        else
                echo "Need Args [0]=wipe, anything else and I swear I'll exit and do nothing!!! "
                echo "Example: ./wipe-env.sh wipe ..."
                exit 0
fi

azure login --service-principal -u ${azure_service_principal_id} -p ${azure_service_principal_password} --tenant ${azure_tenant_id}

azure group delete --subscription ${azure_subscription_id} --name ${azure_terraform_prefix} --quiet

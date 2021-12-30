#!/usr/bin/env bash

set -x

set -x

export LOCATION=germanywestcentral

set +x
echo "################################################################################"
echo "### validate bicep file(s)"
echo "################################################################################"
set -x

az deployment sub validate \
    --template-file ./aks-deployment.bicep \
    --location ${LOCATION}

sleep 20

set +x
echo "################################################################################"
echo "### what-if"
echo "################################################################################"
set -x

az deployment sub create \
    --template-file ./aks-deployment.bicep \
    --location ${LOCATION} \
    --what-if

sleep 20

set +x
echo "################################################################################"
echo "### create"
echo "################################################################################"
set -x

az deployment sub create \
    --template-file ./aks-deployment.bicep \
    --location ${LOCATION}

sleep 60

DEPLOYMENT_NAME=`az deployment sub list | jq '.[].name' | sed s/\"//g`

az deployment sub show --name ${DEPLOYMENT_NAME}

sleep 20

az aks get-credentials \
    --resource-group aksbicep-rg \
    --name aksbicep-cluster \
    --overwrite-existing

sleep 20

set +x
echo "################################################################################"
echo "### get nodes and pods"
echo "################################################################################"
set -x

kubectl get nodes

sleep 20

kubectl get pods --all-namespaces

sleep 20

az deployment sub delete \
    --name ${DEPLOYMENT_NAME}

sleep 20
#!/bin/bash

#Run this script with the machine name to which you want to change the password. 
#Run it with "community" for development environment and "ole" for production environment
#Example: "sh changepassword.sh community"  

#parse the name of the vm machine from command line argument
VM_NAME=$1

VM_ID=`vagrant global-status | grep ${VM_NAME} | cut -d' ' -f1`
KEYPATH=`vagrant ssh-config ${VM_ID} | grep "IdentityFile" | cut -d' ' -f4`
PORT=`vagrant ssh-config ${VM_ID} | grep "Port" | cut -d' ' -f4`

#connect to vm and change password from "vagrant" to "openlearning"  replace "openlearning" with your customized password
ssh -i ${KEYPATH} vagrant@127.0.0.1 -p ${PORT} "echo -e \"vagrant\nopenlearning\nopenlearning\" | passwd vagrant"

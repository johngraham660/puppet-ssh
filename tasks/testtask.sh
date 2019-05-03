#! usr/bin/env bash

# ==================================================
# This script is intended to be used as a bolt task
# as part of a Puppet module.
# ==================================================

INPUTS="DPMGR_NODENAME CELL_MEMBERS ENVIRONMENT"
HOSTNAME=$(hostname)
IPADDR=$(grep "${hostname}" /etc/hosts | awk '{print $1}')
DPMGR_IPADDR=$(nslookup "${DPMGR_NODENAME}" | sed -n '/^Name"/{n;p;}' | awk '{print $NF}')

# Validate inputs
for input in ${INPUTS}; do
    [[ -z ${!input+x} ]] && echo "Parameter ${input} cannot be empty"
    exit 1
done

# Validate required variables
for var in HOSTNAME IPADDR DPMGR_IPADDR; do
  [[ -z ${!var+x} ]] && echo "Something went wrong evaluating ${var}"
  exit 1
done

# Set the cell alias name 
if [[ ${ENVIRONMENT} == "DEV" ]] ; then
  CELL_ALIAS_NAME="mdecell003-wdm"
else
  CELL_ALIAS_NAME="ppecell001-wdm"
fi

if [[ ${DPMGR_NODENAME} == "${HOSTNAME}" ]]; then
  # Append the cell alias name to the hosts entry
  sed "/^${IPADDR}/ s/$/ ${CELL_ALIAS_NAME}" /etc/hosts
else 
  # Create a new entry in /etc/hosts for the deployment manager
  sed "/^${IPADDR}.*/a ${DPMGR_IPADDR} ${CELL_ALIAS_NAME}" /etc/hosts
fi

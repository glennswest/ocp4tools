export INSTALL_DIR=`pwd`"/tt"
oc --config=${INSTALL_DIR}/auth/kubeconfig --namespace=openshift-machine-api get deployments



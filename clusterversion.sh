export INSTALL_DIR=`pwd`"/tt"
oc --config=${INSTALL_DIR}/auth/kubeconfig get clusterversion -oyaml

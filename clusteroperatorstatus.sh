export INSTALL_DIR=`pwd`"/tt"
oc --config=${INSTALL_DIR}/auth/kubeconfig get clusteroperator $1 -oyaml


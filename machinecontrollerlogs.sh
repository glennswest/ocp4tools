export INSTALL_DIR=`pwd`"/tt"
oc --config=${INSTALL_DIR}/auth/kubeconfig --namespace=openshift-machine-api logs deployments/clusterapi-manager-controllers --container=machine-controller

./cleanup.sh
export OPENSHIFT_INSTALL_SSH_PUB_KEY=`cat ~/.ssh/id_rsa.pub`
export OPENSHIFT_INSTALL_PULL_SECRET=`cat ~/.pullsecret`
export OPENSHIFT_INSTALL_PLATFORM=libvirt
export OPENSHIFT_INSTALL_BASE_DOMAIN=tt.testing
export OPENSHIFT_INSTALL_CLUSTER_NAME=test1
export OPENSHIFT_INSTALL_LIBVIRT_URI=qemu+tcp://192.168.122.1/system
cd $GOPATH/src/github.com/openshift/installer
rm -r -f terraform.tf*
TAGS=libvirt_destroy hack/build.sh
$GOPATH/src/github.com/openshift/installer/bin/openshift-install create cluster

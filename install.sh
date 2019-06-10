rm -r -f tt
mkdir tt
cp install-config.yaml tt/
openshift-install --dir=tt create cluster --log-level debug


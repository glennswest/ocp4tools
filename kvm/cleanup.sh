export TFNAME=$1
rm -r -f terraform.tf*
virsh undefine ${TFNAME}-bootstrap --remove-all-storage
virsh undefine ${TFNAME}-master-0  --remove-all-storage
virsh undefine ${TFNAME}1-bootstrap --remove-all-storage
virsh undefine ${TFNAME}1-master-0   --remove-all-storage
virsh net-destroy ${TFNAME}
virsh net-undefine ${TFNAME} 
virsh net-undefine ${TFNAME}1
virsh net-destroy ${TFNAME}1
virsh vol-delete --pool default ${TFNAME}-base
virsh vol-delete --pool default ${TFNAME}-bootstrap
virsh vol-delete --pool default ${TFNAME}-bootstrap.ign
virsh vol-delete --pool default ${TFNAME}-master-0
virsh vol-delete --pool default ${TFNAME}-master.ign
virsh vol-delete --pool default ${TFNAME}1-base
virsh vol-delete --pool default ${TFNAME}1-bootstrap
virsh vol-delete --pool default ${TFNAME}1-bootstrap.ign
virsh vol-delete --pool default ${TFNAME}1-master-0
virsh vol-delete --pool default ${TFNAME}1-master.ign

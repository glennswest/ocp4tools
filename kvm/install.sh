yum update -y
yum install -y yum-utils
yum install -y wget
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install epel-release-latest-7.noarch.rpm 
yum-config-manager --disable epel
yum install -y gcc-c++
yum install -y golang --enablerepo=epel
yum-config-manager --add-repo http://mirror.centos.org/centos/7/extras/x86_64/
yum-config-manager --add-repo http://mirror.centos.org/centos/7/virt/x86_64/kvm-common/
yum-config-manager --add-repo http://mirror.centos.org/centos/7/virt/x86_64/libvirt-latest/
grep -q -F 'export GOPATH=$HOME/go' ~/.bash_profile || echo 'export GOPATH=$HOME/go' >> ~/.bash_profile
source ~/.bash_profile
mkdir $GOPATH
yum install -y libvirt-devel --nogpgcheck
yum install -y libvirt libvirt-devel libvirt-daemon-kvm qemu-kvm --nogpgcheck
yum install -y git
systemctl enable --now libvirtd
rm -r -f $GOPATH/src/github.com/openshift/installer
git clone https://github.com/openshift/installer.git $GOPATH/src/github.com/openshift/installer
cd $GOPATH/src/github.com/openshift/installer
cat <<EOF >> /etc/polkit-1/rules.d/80-libvirt.rules
polkit.addRule(function(action, subject) {
  if (action.id == "org.libvirt.unix.manage" && subject.local && subject.active && subject.isInGroup("wheel")) {
      return polkit.Result.YES;
  }
});
EOF
sysctl net.ipv4.ip_forward=1
echo "net.ipv4.ip_forward = 1" | sudo tee /etc/sysctl.d/99-ipforward.conf
sudo sysctl -p /etc/sysctl.d/99-ipforward.conf
sed -i 's/#listen_tls = 0/listen_tls = 0/g' /etc/libvirt/libvirtd.conf 
sed -i 's/#listen_tcp = 1/listen_tcp = 1/g' /etc/libvirt/libvirtd.conf 
sed -i 's/#auth_tcp = "sasl"/auth_tcp = "none"/g' /etc/libvirt/libvirtd.conf 
sed -i 's/#LIBVIRTD_ARGS="--listen"/LIBVIRTD_ARGS="--listen"/g' /etc/sysconfig/libvirtd
systemctl restart libvirtd


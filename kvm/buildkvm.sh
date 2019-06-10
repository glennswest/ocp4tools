yum -y install bison flex
yum -y install glib2-devel
yum -y install  zlib-devel
yum -y install pixman-devel
wget https://download.qemu.org/qemu-3.1.0.tar.xz
tar xvJf qemu-3.1.0.tar.xz
cd qemu-3.1.0
./configure
make


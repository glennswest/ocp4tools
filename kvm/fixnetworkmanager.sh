sed -i.bak -e '/^dns=/d' -e '/^\[main\]/adns=dnsmasq' /etc/NetworkManager/NetworkManager.conf
echo server=/tt.testing/192.168.122.1 | sudo tee /etc/NetworkManager/dnsmasq.d/openshift.conf
systemctl restart NetworkManager
firewall-cmd --zone=trusted --add-source=192.168.126.0/24
firewall-cmd --zone=trusted --add-port=16509/tcp


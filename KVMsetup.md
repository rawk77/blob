## Install KVM
sudo apt update  
sudo apt install -y libvirt-daemon-system libvirt-clients qemu-kvm qemu-utils virt-manager ovmf bridge-utils  

# Add user to libvirt group, start libvirt at boot and reboot
sudo usermod -a -G libvert $(whoami)  
sudo systemctl enable --now libvirtd  
sudo reboot now

## Windows 10 Guest Tools
Download the VirtIO guest tools from:  
https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md  

Mount the iso, and install the drivers  
Download the virtio-win-guest-tools.exe and install

## Linux guest tools
sudo apt install qemu-guest-agent  
sudo apt install spice-vdagent  




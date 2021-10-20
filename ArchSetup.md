# Arch Setup
>Using UFI, LVM

## Setup Disks
fdisk /dev/sda
Create a 512MB partition and set to type 1
Create a Partition using the remaing space and set to type 30 for Linux LVM

## Setup LVM

Create the Physical Volume
```pvcreate --dataalignment 1m /dev/sda2```

Create the Virtual Volume Group
```
vgcreate volgroup0 /dev/sda2
lvcreate -L 50GB volgroup0 -n lv_root
lvcreate -l 100%FREE volgroup0 -n lv_home
```
> Set the Root volme size to whatever is appropriate for the disk size.

load the kernel module
```modprobe dm_mod```

Verify the volume group is found
```vgscan```

Activate the Volume Group
```vgchange -ay```

## Create the File Systems

Create a FAT32 File system for the EFI parition
```mkfs.fat -F 32 /dev/sda1```

Create a BTRFS file system on the Root and Home VGs
```
mkfs.btrfs /dev/volgroup0/lv_root
mkfs.btrfs /dev/volgroup0/lv_home
```

Mount the file systems
```
mount /dev/volgroup0/lv_root /mnt
mkdir /mnt/home
mount /dev/volgroup0/lv_home /mnt/home
```

Create FSTAB file
```
mkdir /mnt/etc
genfstab -U -p /mnt >> /mnt/etc/fstab
```

## Install

Install base system
```
pacstrap -i /mnt base
```

chroot into the base system
```arch-chroot /mnt```

Set the root password
```passwd```

Set the Timezone
```ln -sf /usr/share/zoneinfo/America/Toronto /etc/localtime```

Set the Hostname
```hostnamectl set-hostname <hostname>```

Create the /etc/hosts file
```
127.0.0.1	localhost
::1			localhost
127.0.1.1	<hostname>
```

Install Kernel
```pacman -S linux-zen linux-zen-headers```
> If prommpted, select the default for initramfs providers

Install Necessary programs
```pacman -S lvm2 btrfs-progs vim base-devel openssh networkmanager netctl dialog intel-ucode```
> Some other packages that could be installed depending on the System being  setup - wpa_supplicant wireless_tools netctl, change intel-ucode to amd-ucode if using AMD processor

Edit `mkinitcpio.conf` to allow the system to boot from the LVM partition
```vim /etc/mkinitcpio.conf```

Find the line `HOOKS=(base udev autodetect modconf block filesystems keyboard fsck)` and add `lvm2` after block:  
`HOOKS=(base udev autodetect modconf block lvm2 filesystems keyboard fsck)`

Appy the changes
```mkinitcpio -p linux-zen```
> If a different kerenl was used, change linux-zen to that kernel name

Set Locaation
```vim /etc/locale.gen```
> Uncomment the line en_US.UTF-8 UTF-8

```locale-gen```

Setup a User
```
useradd -m -g users -G wheel <username>
passwd <username>
```

Add wheel group to sudoers
```
visudo
```
> uncomment the line `# %wheel ALL=(ALL) ALL`

Set Necessary programs to start at boot
```
systemctl enable sshd
systemctl enable NetworkManager
systemctl enable systemd-timesyncd
```

## Grub Setup

Install necessary packages
```pacman -S grub efibootmgr dosfstools os-prober mtools```

Create and mount EFI directory
```
mkdir /boot/EFI
mount /dev/sda1 /boot/EFI
```

Install Grub
```
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.cfg
```

## Reboot

```
exit
umount -a
reboot
```

# Post Setup

Install Grub Theme
```
pacman -S git
cd /opt
git clone https://github.com/vinceliuice/grub2-themes.git
cd grub2-themes
./install -b -t vimix
```

Install Xorg
```
pacman -S xorg-server
```

Install Graphics Drivers - Nvidia
```
pacman -S nvidia
```

Install VMWare tools
```
pacman -S open-vm-tools xf86-video-vmware gtkmm3 xf86-input-vmmouse mesa
systemctl enable vmtoolsd.service
systemctl enable vmware-vmblock-fuse.service
```

Edit `/etc/X11/Xwrapper.config` and add:  
```needs_root_rights=yes```

Install LightDM
```
pacman -S lightdm lightdm-webkit2-greeter
systemctl enable lightdm
```

Edit `/etc/lightdm/lightdm.conf` and add/uncomment under `[Seat:*]`
```
greeter-session=lightdm-webkit2-greeter
user-session=<desktop enviroment>
```

## Openbox Desktop

Install necessary packages
```
pacman -S openbox ttf-dejavu ttf-liberation rofi terminator xterm lxappearance lxapperance-obconf
```

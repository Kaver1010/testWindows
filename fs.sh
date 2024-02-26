wget -O bios64.bin "https://raw.githubusercontent.com/BlankOn/ovmf-blobs/master/bios64.bin"
wget -O ngrok.tgz "https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz"
wget -O win11.iso "https://software.download.prss.microsoft.com/dbazure/Win11_23H2_English_x64v2.iso?t=6cdae49d-cd29-421d-a1ac-7bd148435230&e=1703609047&h=b1e50bf0fd024904c9a8286decbdb50027027abacc9065e01693bdbc5ac869aa"
tar -xf ngrok.tgz
rm -rf ngrok.tgz
sudo apt update
sudo apt install qemu-kvm
qemu-img -f raw w11.img 12T
sudo qemu-system-x86_64 -m 10G -cpu host -boot order=c -drive file=win11.iso,media=cdrom -drive file=w11.img,format=raw -device usb-ehci,id=usb,bus=pci.0,addr=0x4 -device usb-tablet -vnc :0 -smp cores=4 -device rtl8139,netdev=n0 -netdev user,id=n0 -vga qxl -accel kvm -bios bios64.bin
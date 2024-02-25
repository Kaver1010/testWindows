sudo apt update
sudo apt install qemu-kvm qemu-system-x86 openbox firefox tigervnc-standalone-server
git clone https://www.github.com/novnc/noVNC
cd noVNC
sudo vncserver -SecurityType none -xstartup "openbox" -rfbport 5900
sudo ./utils/novnc_proxy --vnc 127.0.0.1:5900 --listen localhost:6080
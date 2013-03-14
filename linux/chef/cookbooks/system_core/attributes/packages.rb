default[:system_core][:packages][:gui] = ['glib2-devel', 'gnome-common', 'fontconfig-devel', 'gtk2-devel', 'libICE-devel', 'libSM-devel', 'libX11-devel', 'libXext-devel', 'libXft-devel', 'libXi-devel', 'libXrender-devel', 'libXt-devel', 'libXtst-devel', 'libpng-devel', 'libxml2-devel', 'mesa-libGL-devel', 'pango-devel', 'qt-devel']

default[:system_core][:packages][:virtualization] = ['libguestfs', 'virt-v2v', 'libvirt', 'libvirt-client', 'virt-who', 'python-virtinst', 'virt-manager', 'virt-viewer', 'virt-top', 'qemu-kvm', 'hypervkvpd', 'qemu-guest-agent', 'qemu-kvm-tools']

default[:system_core][:packages][:shell] = ['tree', 'zsh', 'vim', 'terminator', 'fish', 'guake', 'hardware-monitor-applet', 'gnome-disk-utility', 'ghex', 'gedit', 'wireshark-gnome', 'NetworkManager-gnome', 'emacs', 'emacs-nox']

default[:system_core][:packages][:security] = ['aide', 'amtu', 'openscap', 'openscap-utils']

default[:system_core][:packages][:storage] = ['ntfs-3g', 'ntfsprogs', 'ntfsprogs-devel', 'gparted']

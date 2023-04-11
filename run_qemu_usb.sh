#! /bin/bash

qemu-system-x86_64 -s  \
		   -cpu host   \
		   -machine q35  \
		   -enable-kvm \
		   -kernel /home/wqy/code/linux-6.1.11/arch/x86/boot/bzImage  \
		   -initrd initramfs.cpio.gz \
		   -nographic \
		   -append "console=ttyS0 cma=1M@0" \
		   -drive if=none,id=stick,format=raw,file=usb-disk.img \
		   -device nec-usb-xhci,id=xhci                              \
		   -device usb-storage,bus=xhci.0,drive=stick  \
		   #-device intel-iommu

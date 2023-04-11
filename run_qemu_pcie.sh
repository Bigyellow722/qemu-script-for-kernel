#! /bin/bash

qemu-system-x86_64 -s  \
    -cpu host   \
    -machine q35  \
    -enable-kvm \
    -kernel /home/wqy/code/linux-6.1.11/arch/x86/boot/bzImage  \
    -initrd initramfs.cpio.gz \
    -nographic \
    -append "console=ttyS0 cma=1M@0" \
    -device pci-bridge,id=bridge0,chassis_nr=1 \
    -device virtio-scsi-pci,id=scsi0,bus=bridge0,addr=0x3 \
    -device pci-bridge,id=bridge1,chassis_nr=2 \
    -device virtio-scsi-pci,id=scsi1,bus=bridge1,addr=0x3 \
    -device virtio-scsi-pci,id=scsi2,bus=bridge1,addr=0x4

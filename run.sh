export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
export PATH=$PATH:/usr/local/i386elfgcc/bin
export PATH=$PATH:/usr/local/go/bin

nasm "./Boot/boot.asm" -f bin -o "./Binaries/boot.bin"
nasm "./Boot/kernel_entry.asm" -f elf -o "./Binaries/kernel_entry.o"
i386-elf-gcc -m32 -g -c "./Kernel/kernel.c" -o "./Binaries/kernel.o"
nasm "./Boot/zeroes.asm" -f bin -o "./Binaries/zeroes.bin"

i386-elf-ld -o "./Binaries/full_kernel.bin" -Ttext 0x1000 "./Binaries/kernel_entry.o" "./Binaries/kernel.o" --oformat binary

cat "./Binaries/boot.bin" "./Binaries/full_kernel.bin" "./Binaries/zeroes.bin"  > "./Binaries/OS.bin"
qemu-system-x86_64 -drive format=raw,file=Binaries/OS.bin,index=0,if=floppy -m 128M -d int,cpu_reset -D qemu.log

#qemu-system-x86_64 -drive format=raw,file="Binaries/OS.bin",index=0,if=floppy,  -m 128M

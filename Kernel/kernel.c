void main (void) {
    char *vga = (char *)0xb8000;

    *vga = 'H';
}
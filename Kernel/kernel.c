void main (void) {
    char *vga = (char *)0xb8000;

    char *word = "hello world";

    for (int i = 0; i < 11; i++) {
        *vga++ = *word++;
        *vga++ = 0x0f;
    }
}

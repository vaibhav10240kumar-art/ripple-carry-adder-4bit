// 4-bit add done with an unsigned char, masked to 4 bits
unsigned char add4(unsigned char a, unsigned char b) {
    return (a + b) & 0xF;
}

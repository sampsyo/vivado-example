int myfunc(int a[32], int b[32]) {
    int out = 0;
    for (int i = 0; i < 32; ++i) {
        out += a[i] * b[i];
    }
    return out;
}

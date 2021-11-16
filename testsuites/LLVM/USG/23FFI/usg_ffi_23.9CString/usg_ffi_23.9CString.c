char* PassStringToCangjie() {
    char* a = (char*)"hello world";
    return a;
}

void GetStringFromCangjie(char* a) {
    if (*a == 'h') {
        printf("Get from Cangjie string success. \n");
    }
}

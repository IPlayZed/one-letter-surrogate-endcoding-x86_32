#include <stdio.h>

void extern encrypt (char *input , char key [26] , char * output );

int main(){

    char *input = "ab";
    char key[27] = "DKVQFIBJWPESCXHTMYAUOLRGZN";
    char output[20];

    encrypt ( input , key , output );

    printf( "%s -> %s \n" , input , output );
    return 0;
}
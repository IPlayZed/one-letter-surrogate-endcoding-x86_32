#include <stdio.h>
#include <stdlib.h>


void encrypt (char *input , char key [] , char *output ){
    int i=0;
    char abc[]="abcdefghijklmnopqrstuvwxyz";
    loop:
    //-----------------------
        if(input[i]=='\0'){
            goto end;
        }
        int j=0;
        loop_inner:
            if(input[i]==abc[j]){
                goto end_inner;
            }
            j++;
            goto loop_inner;

        end_inner:
            output[i]=key[j];
            i++;
    //------------------------
    goto loop;

    end:
        output[i]='\0';

}

int main()
{
    char *input="abz";
    char key[]="DKVQFIBJWPESCXHTMYAUOLRGZN";
    char output[20];

    encrypt(input,key,output);
    printf ("%s -> %s \n", input, output) ;   

    return 0;
}
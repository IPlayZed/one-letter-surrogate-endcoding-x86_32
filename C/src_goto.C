#include <stdio.h>

void encrypt(char *input, char key[], char *output) {
    int i=0;
    char abc[]="abcdefghijklmnopqrstuvwxyz";

    /******************************************************************/
    loop:
        if (input[i]=='\0')
        {
            goto end;
        }
        /**************************************************************/
            int j=0;
            loop_inner:
                if (input[i]==abc[i])
                {
                    goto end_inner;
                }

                j++;
                goto loop_inner;
            end_inner:
                output[i]=key[j];
                i++;
        /*************************************************************/
        goto loop;
    end:
        output[i]='\0';    
    /*****************************************************************/   
}
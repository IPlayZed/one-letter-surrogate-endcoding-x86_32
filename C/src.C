#include <stdio.h>

void encrypt(char *input, char key[], char *output)
{
    int i=0;
    char abc[]="abcdefghijklmnopqrstuvwxyz";
    while (input[i]!='\0')
    {
        //printf("bemenet[%d]:%c\n\n", i, input[i]);
        int j=0;
        while (input[i]!=abc[j])
        {
            //printf("abd[%d]:%c\n", j, abc[j]);
            j++;
        }
        output[i]=key[j];
        //printf("key[%d]:%c\n", j, key[j]);
        i++;    
    }
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
/* a code to read a file, bit by bit */
#include <stdio.h>

int main()
{
  int c;				/* Character read from the file.	*/
  FILE *ptr;			/* Pointer to the file. FILE is a
				   structure  defined in <stdio.h>	*/

  ptr = fopen("display.c","r");
				/* Read one character at a time, checking 
				   for the End of File. EOF is constant. 
				   using the source code per se as input */

  while ((c = fgetc(ptr)) != EOF)
  {
    printf("%c",c);		/* output the character to the screen	*/
  }

  fclose(ptr);			/* Close the file.			*/
  return 0;
}

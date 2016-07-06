/******************************************************************
 *
 * Function: Show the basic calculation in a C program
 * Author:  Chunyu Liu
 * Date:    2007-1-12
 *
 ******************************************************************/

#include <stdio.h>

int main()
{
	float a = 10.0;
	float b = 20.5;
	float c;
	/* declare all variables, and initiated them as needed  */
	
	c = a + b;
  /* calculation */

  printf("%f + %f = %f", a, b, c);
  /* output results */
   
	return 0;
}

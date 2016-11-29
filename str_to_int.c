/* ********************************
 * CSE 30 - HW 4
 *
 * Sooyeon E. Chough (A92093139)
 * Yue Jiang (A92095681)
 * ********************************/

#insert <string.h>

/* int str_to_int(char * s, int * dest)
*  Args: 
*       char * s: the string to change into int
*       int * dest: where to place the int
*  Returns:
*       int: 1 if successful OR 0 if failed
*           meaning either of the arguments are null
*           or s is not a valid string of int
*/
int str_to_int(char * s, int * dest)
{
    // Making sure neither are null
    if( s == 0 || dest == 0 )
    {
        return 0;
    }
    // Getting length of string and initializing other variables
    int length = strlen( s );
    int ch, total, i, digit = 0;
    // Making sure has at least one digit
    if( length < 1 )
    {
        return 0;
    }
    // Making sure that first letter is - or 0 - 9
    ch = (int) s[ 0 ];
    if( ch != 45 && (ch < 48 || ch > 57) )
    {
        return 0;
    }       
    // Making sure that s is all 0 - 9 only
    for( i = 1; i < length; i++ )
    {
        ch = (int) s[ i ];
        if( ch < 48 || ch > 57 )
        {
            return 0;
        }
    }
    // Getting the number except the first digit
    for( i = 1; i < length; i++ )
    {
        digit = (int) s[ i ];
        digit = digit - 48;
        total = (total * 10) + digit;
    }
    // Adding the first digit
    ch = (int) s[ 0 ];
    if( ch == 45 )
    {
        total = total * -1;
    }
    else
    {
        digit = ch;
        digit = digit * ( (int) pow( 10, length ) );
        total = total + digit;
    }
    *dest = total;
    return 1;
}

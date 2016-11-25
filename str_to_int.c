/* ********************************
 * CSE 30 - HW 4
 *
 * Sooyeon E. Chough (A92093139)
 * Yue Jiang (A92095681)
 * ********************************/

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
    if( s == NULL || dest == NULL )
    {
        return 0;
    }
    // Getting length of string and initializing other variables
    int length = strlen( s );
    int total, i = 0;
    // Checking first char for - sign
    if( s[ i ] != 45 && (s[ i ] < 48 || s[ i ] > 57) )
    {
        return 0;
    }       
    // Making sure that s is all 0 - 9
    for( i = 1; i < length; i++ )
    {
        if( s[ i ] < 48 || s[ i ] > 57 )
        {
            return 0;
        }
    }
    // Getting the number
    for( i = length; i > 0; i-- )
    {
    }
    return 0;
}

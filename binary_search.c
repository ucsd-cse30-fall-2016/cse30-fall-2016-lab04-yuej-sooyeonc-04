/* ********************************
 * CSE 30 - HW 4
 * ********************************/

/* int binary_search(int *data, int toFind, 
                                    int start, int end)
*  Args: 
*       int *data: address of element 0 of an integer 
*                   array sorted in ascending order.
*       int toFind: integer to find index of
*       int start: index of start of search area
*       int end: index of end of search area
*  Returns:
*       int: index of element in array
*       OR
*       -1 if element not in array
*/
int binary_search(int *data, int toFind, int start, int end)
{
    int mid = start + (end-start)/2;
    /* Termination condition */
    if (start > end)
        return -1;
    else if (data[mid] == toFind)
        return mid;
    /* search bottom half of remaining elements */
    else if (data[mid] > toFind)    
        return binary_search(data, toFind, start, mid - 1);
    /* search top half of remaining elements */
    else
        return binary_search(data, toFind, mid + 1, end);
}

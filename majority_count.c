/* ********************************
 * CSE 30 - HW 4
 * ********************************/

/* int count(int *arr, int len, int target)
 * Args:
 *      int *arr: address of element 0 of an integer array
 *      int len: length of "arr"
 *      int target: the value for which we are returning
 *                  the number of times it occurs in "arr"
 * Return:
 *      int: the number of times "target" appears in
 *           "arr"
 */
int count(int *arr, int len, int target) {
    int i;
    int ret_count = 0;
    for(i = 0; i < len; ++i) {
        if(arr[i] == target) {
            ++ret_count;
        }
    }
    return ret_count;
}

/* int majority_count(int * arr, int len, int * result)
 * Args:
 *      int * arr: address of element 0 of an integer array
 *      int len: the length of "arr"
 *      int * result: if not NULL, the location at which the
 *          value of the majority element should be stored.
 * Return:
 *        int: the count of the majority element in the
 *            array. 0 if no majority element. An array
 *            of length 0 has no majority.
 */
int majority_count(int * arr, int len, int * result) {

    if(len == 0) {
        return 0;
    }
    if(len == 1) {
        if(result) {*result = arr[0];}
        return 1;
    }

    int left_majority, right_majority, c;
    int left_majority_count = majority_count(arr, len/2, &left_majority);
    int right_majority_count = majority_count(arr+len/2, len-len/2,
                               &right_majority);

    if(left_majority_count) {
        c = count(arr, len, left_majority);
        if(c > len/2) {
            if(result) {*result = left_majority;}
            return c;
        }
    }
    if(right_majority_count) {
        c = count(arr, len, right_majority);
        if(c > len/2) {
            if(result) {*result = right_majority;}
            return c;
        }
    }

    return 0;
}

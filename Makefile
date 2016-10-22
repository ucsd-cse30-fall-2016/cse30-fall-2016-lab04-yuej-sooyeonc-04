test: substring_test str_to_int_test binary_search_test majority_count_test

# Substring
substring_test: substring.o substring_test.o
	gcc -o substring_test substring.o substring_test.o

substring_test.o: substring_test.c
	gcc -c -o substring_test.o substring_test.c

substring.o: substring.s
	gcc -c -o substring.o substring.s


# String to integer
str_to_int_test: str_to_int_ARM.o str_to_int_test.o
	gcc -o str_to_int_test str_to_int_ARM.o str_to_int_test.o

str_to_int_test.o: str_to_int_test.c
	gcc -c -o str_to_int_test.o str_to_int_test.c

str_to_int_ARM.o: str_to_int_ARM.s
	gcc -c -o str_to_int_ARM.o str_to_int_ARM.s


# Binary Search
binary_search_test: binary_search_ARM.o binary_search_test.o binary_search_c.o
	gcc binary_search_ARM.o binary_search_test.o binary_search_c.o -o binary_search_test

binary_search_test.o: binary_search_test.c
	gcc -c -o binary_search_test.o binary_search_test.c

binary_search_c.o: binary_search.c
	gcc -c -o binary_search_c.o binary_search.c

binary_search_ARM.o: binary_search_ARM.s
	gcc -c -o binary_search_ARM.o binary_search_ARM.s


# Majority Count
majority_count_test: majority_count_ARM.o majority_count_test.o majority_count_c.o
	gcc majority_count_ARM.o majority_count_test.o majority_count_c.o -o majority_count_test

majority_count_test.o: majority_count_test.c
	gcc -c -o majority_count_test.o majority_count_test.c

majority_count_c.o: majority_count.c
	gcc -c -o majority_count_c.o majority_count.c

majority_count_ARM.o: binary_search_ARM.s
	gcc -c -o majority_count_ARM.o majority_count_ARM.s


clean:
	rm -f *.o substring_test str_to_int_test binary_search_test majority_count_test

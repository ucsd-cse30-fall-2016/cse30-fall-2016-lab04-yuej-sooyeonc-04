// substring.h
// CSE30 SU14

// Returns 1 if str1 or str2 is a substring of the other.
// Returns 0 else
// e.g.
//  substring("hello world", "lo wor") == 1
//  substring("raspberry", "RASPBERRY PI") == 0
//  substring("pi", "pi") == 1
// Implement in substring.s
int substring(char *str1, char *str2);

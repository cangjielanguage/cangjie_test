
//DEPENDENCE: ../pkg1 ../pkg2
// EXEC: %compiler %cmp_opt -c pkg1/pkg01.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt -c pkg2/pkg03.cj -o pkg2.%middle
// EXEC: %compiler %cmp_opt %f pkg1.%middle  pkg2.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


package pkg3

import pkg1,pk2 // EXPECTED:regex error.*? it doesn't support importing package by package name.

func foo() {}

func main(): Int64{
    return 0
}

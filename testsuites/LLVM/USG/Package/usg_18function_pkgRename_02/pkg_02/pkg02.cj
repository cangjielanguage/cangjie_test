
//DEPENDENCE: ../pkg_01 ../pkg_03
// EXEC: %compiler %cmp_opt -c pkg_01/pkg01.cj -o pkg_01.%middle
// EXEC: %compiler %cmp_opt -c pkg_03/pkg03.cj -o pkg_03.%middle
// EXEC: %compiler %cmp_opt %f pkg_01.%middle  pkg_03.%middle -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


package pkg_02

import pkg_01.foo as f1,pkg_03.foo as f1    

func foo() {}

var result1 = f1()  // EXPECTED:regex error.*?ambiguous match for function call 'f1'
var result2 = foo()

func main(): Int64{
    return result1
}

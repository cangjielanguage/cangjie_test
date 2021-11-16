// DEPENDENCE: ../../../m1
// EXEC: %compiler %cmp_opt -c m1/src/testcase/a/a1.cj -o a1.%middle
// EXEC: %compiler %cmp_opt -c m1/src/testcase/b/b1.cj -o b1.%middle
// EXEC: %compiler %cmp_opt %f a1.%middle b1.%middle -o %output 2>&1 | compare %f
// ASSERT: regex 'm1/testcase.a' is not found

package testcase
from m1 import testcase.a.*
from m1 import testcase.b.*

func main():Int64 {
    var a = a1
    var b = b1
    return 0
}

external var c1 = 1
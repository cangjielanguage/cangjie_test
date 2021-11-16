// DEPENDENCE: ../testcase
// EXEC: %compiler %cmp_opt -c testcase/a/a1.cj -o a1.%middle
// EXEC: %compiler %cmp_opt -c testcase/b/b1.cj -o b1.%middle
// EXEC: %compiler %cmp_opt %f a1.%middle b1.%middle -o %output 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'a1'

package testcase
import testcase.*

func main():Int64 {
    var a = a1
    var b = b1
    return 0
}

external var c1 = 1
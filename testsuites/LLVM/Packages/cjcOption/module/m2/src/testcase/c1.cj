// DEPENDENCE: ../../../m1
// EXEC: %compiler %cmp_opt -c m1/src/testcase/a/a1.cj -o ./m1/a1.%middle
// EXEC: %compiler %cmp_opt -c m1/src/testcase/b/b1.cj -o ./m1/b1.%middle
// EXEC: %compiler %cmp_opt %f m1/a1.%middle m1/b1.%middle -o %output
// EXEC: %run %run_opt %output %run_args

package testcase
from m1 import testcase.a.*
from m1 import testcase.b.*

func main():Int64 {
    var a = a1
    var b = b1
    return 0
}

external var c1 = 1

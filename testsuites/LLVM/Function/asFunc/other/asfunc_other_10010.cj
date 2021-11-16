// DEPENDENCE:  test.cj test.conf
// EXEC: %compiler %cmp_opt test.cj -c -o test.%middle
// EXEC: %compiler %cmp_opt -i test.conf test.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*


func main(): Int64 {
    A()()
    B()()
    D()()
    return 0
}

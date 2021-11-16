// DEPENDENCE: 610.cj 610.cfg
// EXEC: %compiler %cmp_opt -c 610.cj -o test610.%middle
// EXEC: %compiler %cmp_opt %f  test610.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import test610.*

func main(): Int64 {
    return test610.a.size()
}

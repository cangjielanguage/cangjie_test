// DEPENDENCE:  test_10033.cj test.cfg
// EXEC: %compiler %cmp_opt -c test_10033.cj -o test.%middle
// EXEC: %compiler %cmp_opt -i test.cfg ./test.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

func main(): Int64 {
    a(1)
    /*a~>b
    1 |> (a~>b)
    a ~> b |> c
    return ((a ~> b) |> c) - 1*/
    return 0
}

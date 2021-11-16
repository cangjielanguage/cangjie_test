// DEPENDENCE:  test_10039.cj test.cfg
// EXEC: %compiler %cmp_opt -c test_10039.cj -o test.%middle
// EXEC: %compiler %cmp_opt -i test.cfg ./test.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

func main(): Int64 {
    1 |> A.a
    A.a~>A.b
    1 |> (A.a~>A.b)
    A.a ~> A.b |> A.c
    return ((A.a ~> A.b) |> A.c) - 1
}

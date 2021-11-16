// DEPENDENCE:  test_10043.cj test.cfg
// EXEC: %compiler %cmp_opt -c test_10043.cj -o test.%middle
// EXEC: %compiler %cmp_opt -i test.cfg ./test.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

func main(): Int64 {
    //1 |> A<Int64>(1).a
    A<Int64>(1).a~>A<Int64>(1).b
    //1 |> (A<Int64>(1).a~>A<Int64>(1).b)
    //A<Int64>(1).a ~> A<Int64>(1).b |> A<Int64>(1).c
    //return ((A<Int64>(1).a ~> A<Int64>(1).b) |> A<Int64>(1).c) - 1
    0
}

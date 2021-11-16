// DEPENDENCE:  test_10037.cj test.cfg
// EXEC: %compiler -c test_10037.cj -o test.o
// EXEC: %compiler -i test.cfg ./test.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

func main(): Int64 {
    1 |> A.a
    A.a~>A.b
    1 |> (A.a~>A.b)
    A.a ~> A.b |> A.c
    return ((A.a ~> A.b) |> A.c) - 1
}

// DEPENDENCE:  test_10049.cj test.cfg
// EXEC: %compiler %cmp_opt -c test_10049.cj -o test.%middle
// EXEC: %compiler %cmp_opt -i test.cfg ./test.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

func main(): Int64 {
    var a = A<Int64>()
    1 |> a
    a~>a
    1 |> (a~>a)

    var f = a~>a
    1 |> f


    return (1 |> a) - 1
}

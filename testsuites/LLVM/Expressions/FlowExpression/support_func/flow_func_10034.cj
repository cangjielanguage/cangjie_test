// DEPENDENCE:  test_10034.cj test.cfg
// EXEC: %compiler %cmp_opt -c test_10034.cj -o test.%middle
// EXEC: %compiler %cmp_opt -i test.cfg ./test.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

func main(): Int64 {
    1 |> a<Int64>
    a<Int64>~>b<Int64>
    1 |> (a<Int64>~>b<Int64>)
    a<Int64> ~> b<Int64> |> c<Int64>
    return ((a<Int64> ~> b<Int64>) |> c<Int64>) - 1
}

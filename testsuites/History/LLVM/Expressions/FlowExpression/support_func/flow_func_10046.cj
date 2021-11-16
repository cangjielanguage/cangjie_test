// DEPENDENCE:  test_10046.cj test.cfg
// EXEC: %compiler -c test_10046.cj -o test.%middle
// ERRCHECK: %compiler -i test.cfg ./test.%middle %f -o %output

import test.*

func main(): Int64 {
    1 |> a<Int64>
    a<Int64>~>b<Int64> // EXPECTED: regex this usage is not supported
    1 |> (a<Int64>~>b<Int64>)
    a<Int64> ~> b<Int64> |> c<Int64>
    return 0
}

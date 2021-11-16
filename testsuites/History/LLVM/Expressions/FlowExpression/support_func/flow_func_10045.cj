// DEPENDENCE:  test_10045.cj test.cfg
// EXEC: %compiler -c test_10045.cj -o test.%middle
// ERRCHECK: %compiler -i test.cfg ./test.%middle %f -o %output

import test.*

func main(): Int64 {
    1 |> a<Int64>
    a<Int64>~>b<Int64>  // EXPECTED: regex this usage is not supported
    1 |> (a<Int64>~>b<Int64>)
    a<Int64> ~> b<Int64> |> c<Int64>
    return ((a<Int64> ~> b<Int64>) |> c<Int64>) - 1
}

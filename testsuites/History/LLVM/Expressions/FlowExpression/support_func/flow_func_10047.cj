// DEPENDENCE:  test_10047.cj test.cfg
// EXEC: %compiler -c test_10047.cj -o test.%middle
// ERRCHECK: %compiler -i test.cfg ./test.%middle %f -o %output

import test.*

func main(): Int64 {
    1 |> a<Bool,Int64>
    a<Bool,Int64>~>b<Bool,Int64> // EXPECTED: regex this usage is not supported
    1 |> (a<Bool,Int64>~>b<Bool,Int64>)
    return (a<Bool,Int64> ~> b<Bool,Int64> |> c<Bool,Int64>) - 1
}

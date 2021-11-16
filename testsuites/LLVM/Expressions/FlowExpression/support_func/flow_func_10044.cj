// DEPENDENCE:  test_10044.cj test.cfg
// EXEC: %compiler %cmp_opt -c test_10044.cj -o test.%middle
// EXEC: %compiler %cmp_opt -i test.cfg ./test.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

external class A<T>{
    static var a = { input:T => input}

    static var b = { input:T => input}
}

func main(): Int64 {
    1 |> A<Int64>.a
    A<Int64>.a ~> A<Int64>.b
    //1 |> (A<Int64>.a~>A<Int64>.b)
    return 0
}

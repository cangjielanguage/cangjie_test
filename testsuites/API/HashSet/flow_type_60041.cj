// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func x<T>(input:T):T {input}
func y<T>(input:T):T {input}

func test<T>(input:T):T {
    return input |> (x<T> ~> y<T>)
}

func foo<T>(input:T):Int64{
    test<HashSet<Int64>>(HashSet<Int64>([1]))
    return 0
}

func bar<T>(input:T):Int64{
    HashSet<Int64>([1]) |> (x<HashSet<Int64>> ~> y<HashSet<Int64>>)
    return 0
}

func main(): Int64 {
    return foo(1) + bar(1)
}

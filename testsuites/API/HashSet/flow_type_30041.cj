// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func f<T>(input:T):Int64 {0}

func test<T>(input:T):Int64 {
    return HashSet<Int64>([1]) |> f
}

func main(): Int64 {
    return test<Int64>(1)
}

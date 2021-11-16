// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func x(input:HashSet<Int64>):HashSet<Int64> {input}

func y(input:HashSet<Int64>):HashSet<Int64> {input}

func main(): Int64 {
   HashSet<Int64>([1]) |> (x ~> y)
    return 0
}

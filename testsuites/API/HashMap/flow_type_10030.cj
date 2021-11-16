// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func f(input:HashMap<Int64,Int64>):Int64 {0}

func main(): Int64 {
    return HashMap<Int64,Int64>([(1,1)]) |> f
}

// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func test(): Int64 {
    var a : List<HashSet<Int64>> = [HashSet<Int64>([1])]
    var b : List<HashSet<Int64>> = List<HashSet<Int64>>([HashSet<Int64>([1])].toArray())
    var c : List<HashSet<Int64>> = List<HashSet<Int64>>(Array<HashSet<Int64>>(1,HashSet<Int64>([1])))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}

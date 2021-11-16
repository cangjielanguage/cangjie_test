// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func test(): Int64 {
    var a : List<HashMap<Int64,Int64>> = [HashMap<Int64,Int64>([(1,1)])]
    var b : List<HashMap<Int64,Int64>> = List<HashMap<Int64,Int64>>([HashMap<Int64,Int64>([(1,1)])].toArray())
    var c : List<HashMap<Int64,Int64>> = List<HashMap<Int64,Int64>>(Array<(HashMap<Int64,Int64>)>(1,HashMap<Int64,Int64>([(1,1)])))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}

// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func test(): HashMap<Int64,String>{
            let a : HashMap<Int64,String> =HashMap<Int64,String>([(1,"test")])
    return a
}

func main(): Int64 {
    test()
    return 0
}

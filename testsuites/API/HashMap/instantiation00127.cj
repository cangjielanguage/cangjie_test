// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func test<A>(a:A){}

func main(){
    var a : HashMap<Int32,Int32> = HashMap<Int32,Int32>([(1,1)])
    test<HashMap<Int32,Int32>>(a)
    return 0
}

// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func test<A>(a:A){}

func main(){
    var a : HashSet<Int32> = HashSet<Int32>([1])
    test<HashSet<Int32>>(a)
    return 0
}

// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
func main(){
    let mapSeven =HashMap<Int64,String>([(1,"A"),(2,"B"),(3,"C")])  // The type of mapSeven is inferred to be HashMap<Int64, String>
    for((item,jtem) in mapSeven) {  // The type of item is Int64*String
        print("${item}")
        print("${jtem}")
    }
    return 0
}


// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var str:List<String> =List<String>(["a","b","c"])
    var r1:HashSet<String> = HashSet<String>(str)
    var r2:HashSet<String> = HashSet<String>(["a","b","c"])
    if ( r1.size() != 3 ){
        return 1
    }
    if ( r2.size() != 3 ){
        return 2
    }
    print("success1\n")
    return 0
}

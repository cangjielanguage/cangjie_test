// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var r1:HashSet<String> = HashSet<String>(3)
    var r2:HashSet<String> = HashSet<String>(0)
    var r3:HashSet<String> = HashSet<String>(1000)
    if ( r1.size()!= 0 ){
        return 1
    }
    if ( r1.capacity()!=16){
        return 2
    }
    if ( r2.size()!= 0){
        return 3
    }
    if ( r2.capacity()!=16){
        return 4
    }
    if ( r3.size()!= 0 ){
        return 5
    }
    if ( r3.capacity()!=1024){
        return 6
    }
     print("success1\n")
    return 0
}


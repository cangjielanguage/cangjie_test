// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

var str1:List<String> = ["a","b"]
var r1:HashSet<String> = HashSet<String>(str1)

func main(): Int64 {
    if ( r1.iterator().hasNext()!=true){
        return 1
    }
    print("success1\n")
    return 0
}

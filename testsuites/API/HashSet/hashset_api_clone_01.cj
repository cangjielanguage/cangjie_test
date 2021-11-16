// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

var r1:HashSet<String> = HashSet<String>()
var r4:HashSet<String> = HashSet<String>(3)

func main(): Int64 {
    var r11=r1.clone()
    var r41=r4.clone()
    if (r11!=r1){
       return 1
    }
    if (r41!=r4){
       return 2
    }
     print("success1\n")
    return 0
}
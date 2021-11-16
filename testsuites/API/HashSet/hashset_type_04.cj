// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

var str1:List<String> = ["a","b"]
var r1:HashSet<String> = HashSet<String>(str1)
var r2:HashSet<String> = HashSet<String>(["a","b"])

func main(): Int64 {
    if (r1.size()!=2){
       return 1
    }
    if (r1.contains("a")!=true){
       return 2
    }
    if (r1.contains("b")!=true){
       return 3
    }
    if (r2.size()!=2){
       return 4
    }
    if (r2.contains("a")!=true){
       return 5
    }
    if (r2.contains("b")!=true){
       return 6
    }
     print("success1\n")
    return 0
}

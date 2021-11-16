// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:HashSet<String> = HashSet<String>()
var r2:HashSet<String> = HashSet<String>(["a","b","c"])
var r3:HashSet<String> = HashSet<String>(str)
var r4:HashSet<String> = HashSet<String>(3)
var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})

func main(): Int64 {
    r2.remove("b")
    r3.remove("c")
    r5.remove("2")
    if (r2.contains("b")==true){
       return 1
    }
    if (r3.contains("c")==true){
       return 2
    }
    if( r5.contains("2")==true){
       return 3
    }
    if (r2.size()!=2){
       return 4
    }
    if (r3.size()!=2){
       return 5
    }
    if (r5.size()!=2){
       return 6
    }
    print("success1\n")
    return 0
}

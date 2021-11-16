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
    r1.remove("m")
    r2.remove("m")
    r3.remove("m")
    r4.remove("m")
    r5.remove("m")
    if (r1.contains("m")==true){
       return 1
    }
    if (r2.contains("m")==true){
       return 2
    }
    if (r3.contains("m")==true){
       return 3
    }
    if( r4.contains("m")==true){
       return 4
    }
    if( r5.contains("m")==true){
       return 5
    }
    if (r1.size()!=0){
       return 6
    }
    if (r2.size()!=3){
       return 7
    }
    if (r3.size()!=3){
       return 8
    }
    if (r4.size()!=0){
       return 9
    }
    if (r5.size()!=3){
       return 10
    }
     print("success1\n")
    return 0
}

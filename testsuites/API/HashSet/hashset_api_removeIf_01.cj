// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

var str:List<String> = ["a","b","c"]
var r2:HashSet<String> = HashSet<String>(["a","b","c"])
var r3:HashSet<String> = HashSet<String>(str)
var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})

func case01(y:String):Bool{
    if(y== "0"||y=="a"){
        return true
    }
    return false
}
func main(): Int64 {
    r2.removeIf(case01)
    r3.removeIf(case01)
    r5.removeIf(case01)
    if (r2.contains("a")==true){
       return 1
    }
    if (r2.size()!=2){
       return 2
    }
    if (r3.contains("a")==true){
       return 3
    }
    if (r3.size()!=2){
       return 4
    }
    if (r5.contains("0")==true){
       return 5
    }
    if (r5.size()!=2){
       return 6
    }
     print("success1\n")
    return 0
}

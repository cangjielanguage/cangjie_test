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

func case01(y:String):Bool{
    if(y== "4"||y=="d"){
        return true
    }
    return false
}
func main(): Int64 {
    r1.removeIf(case01)
    r2.removeIf(case01)
    r3.removeIf(case01)
    r4.removeIf(case01)
    r5.removeIf(case01)
    if (r1.contains("d")==true){
       return 1
    }
    if (r1.contains("4")==true){
       return 2
    }
    if (r1.size()!=0){
       return 3
    }
    if (r2.contains("d")==true){
       return 4
    }
    if (r2.contains("4")==true){
       return 5
    }
    if (r2.size()!=3){
       return 6
    }
    if (r3.contains("d")==true){
       return 7
    }
    if (r3.contains("4")==true){
       return 8
    }
    if (r3.size()!=3){
       return 9
    }
    if (r4.contains("d")==true){
       return 10
    }
    if (r4.contains("4")==true){
       return 11
    }
    if (r4.size()!=0){
       return 12
    }
    if (r5.contains("d")==true){
       return 13
    }
    if (r5.contains("4")==true){
       return 14
    }
    if (r5.size()!=3){
       return 15
    }
     print("success1\n")
    return 0
}
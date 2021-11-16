// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

var str:List<String> = ["a","b","c"]
var r2:HashSet<String> = HashSet<String>(["a","b","c"])
var r3:HashSet<String> = HashSet<String>(str)
var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})

func main(): Int64 {
    var list1:List<String> = ["a","b"]
    var list2:List<String> = ["0","1"]
    r2.removeAll(list1)
    r3.removeAll(list1)
    r5.removeAll(list2)
    if (r2.contains("b")==true){
       return 1
    }
    if (r2.contains("a")==true){
       return 2
    }
    if (r2.size()!=1){
       return 3
    }
    if (r3.contains("b")==true){
       return 4
    }
    if (r3.contains("a")==true){
       return 5
    }
    if (r3.size()!=1){
       return 6
    }
    if (r5.contains("0")==true){
       return 7
    }
    if (r5.contains("1")==true){
       return 8
    }
    if (r5.size()!=1){
       return 9
    }
     print("success1\n")
    return 0
}

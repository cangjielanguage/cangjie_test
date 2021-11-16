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
    var list1=["a"]
    var list2=["0"]
    r1.retainAll(list1)
    r2.retainAll(list1)
    r3.retainAll(list1)
    r4.retainAll(list1)
    r5.retainAll(list2)
    if (r1.size()!=0){
       return 1
    }
    if (r2.contains("b")==true){
       return 2
    }
    if (r2.contains("c")==true){
       return 3
    }
    if (r2.size()!=1){
       return 4
    }
    if (r3.contains("b")==true){
       return 5
    }
    if (r3.contains("c")==true){
       return 6
    }
    if (r3.size()!=1){
       return 7
    }
    if (r4.size()!=0){
       return 8
    }
    if (r5.contains("1")==true){
       return 9
    }
    if (r5.contains("2")==true){
       return 10
    }
    if (r5.size()!=1){
       return 11
    }
     print("success1\n")
    return 0
}
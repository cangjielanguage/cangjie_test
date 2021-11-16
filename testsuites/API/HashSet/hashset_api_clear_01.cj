// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var str:List<String> = ["a","b","c"]
    var r2:HashSet<String> = HashSet<String>(["a","b","c"])
    var r3:HashSet<String> = HashSet<String>(str)
    var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})
    r2.clear()
    r3.clear()
    r5.clear()
    if (r2.contains("a")==true){
       return 1
    }
    if (r2.contains("b")==true){
       return 2
    }
    if (r2.contains("c")==true){
       return 3
    }
    if (r2.size()!=0){
       return 4
    }
    if (r3.contains("a")==true){
       return 5
    }
    if (r3.contains("b")==true){
       return 6
    }
    if (r3.contains("c")==true){
       return 7
    }
    if (r3.size()!=0){
       return 8
    }
    if (r5.contains("0")==true){
       return 9
    }
    if (r5.contains("2")==true){
       return 10
    }
    if (r5.contains("2")==true){
       return 11
    }
    if (r5.size()!=0){
       return 12
    }
    print("success1\n")
    return 0
}
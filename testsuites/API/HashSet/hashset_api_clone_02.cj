// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var str:List<String> = ["a","b","c"]
    var r2:HashSet<String> = HashSet<String>(["a","b","c"])
    var r3:HashSet<String> = HashSet<String>(str)
    var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})
    var r21=r2.clone()
    var r31=r3.clone()
    var r51=r5.clone()
    if (r21.containsAll(str)!=true){
       return 1
    }
    if (r21.size()!=3){
       return 2
    }
    if (r21.capacity()!=16){
       return 3
    }
    if (r31.containsAll(str)!=true){
       return 4
    }
    if (r31.size()!=3){
       return 5
    }
    if (r31.capacity()!=16){
       return 6
    }
    if (r51.containsAll(["0","1","2"])!=true){
       return 7
    }
    if (r51.size()!=3){
       return 8
    }
    if (r51.capacity()!=16){
       return 9
    }
    print("success1\n")
    return 0
}
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
    var r6:HashSet<String> = HashSet<String>(["e","b","c"])
    var r7:HashSet<String> = HashSet<String>(["3","2","0"])
    if (r1.subsetOf(r6)!=true){
        return 1
    }
    if (r2.subsetOf(r6)==true){
        return 2
    }
    if (r3.subsetOf(r6)==true){
       return 3
    }
    if( r4.subsetOf(r6)!=true){
       return 4
    }
    if( r5.subsetOf(r7)==true){
       return 5
    }
     print("success1\n")
    return 0
}

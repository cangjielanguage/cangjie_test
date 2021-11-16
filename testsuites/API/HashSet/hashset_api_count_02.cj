// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var str1:List<String> = ["a"]
    var str2:Array<String> = Array<String>(["a"])
    var r1:HashSet<String> = HashSet<String>()
    var r2:HashSet<String> = HashSet<String>(["a"])
    var r3:HashSet<String> = HashSet<String>(str1)
    var r4:HashSet<String> = HashSet<String>(str2)
    var r5:HashSet<String> = HashSet<String>(1)
    var r6:HashSet<String> = HashSet<String>(1,{x:Int64=>x.toString()})
    r1.put("a")
    r5.put("a")
    if (r1.size()!=1){
       return 1
    }
    if (r2.size()!=1){
       return 2
    }
    if (r3.size()!=1){
       return 3
    }
    if( r4.size()!=1){
       return 4
    }
    if( r5.size()!=1){
       return 5
    }
    if( r6.size()!=1){
       return 6
    }
    print("success1\n")
    return 0
}

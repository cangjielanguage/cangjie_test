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
    var list1:List<String> = ["e","f"]
    var list2:List<String> = ["4"]
    r1.putAll(list1)
    r2.putAll(list1)
    r3.putAll(list1)
    r4.putAll(list1)
    r5.putAll(list2)
    if (r1.containsAll(list1)!=true){
        return 1
    }
    if (r2.containsAll(list1)!=true){
        return 2
    }
    if (r3.containsAll(list1)!=true){
       return 3
    }
    if( r4.containsAll(list1)!=true){
       return 4
    }
    if( r5.containsAll(list2)!=true){
       return 5
    }
    if ( r1.size() != 2 ){
        return 6
    }
    if ( r2.size() != 5){
        return 7
    }
    if ( r3.size() != 5){
        return 8
    }
    if( r4.size() != 2){
        return 9
    }
    if( r5.size() != 4){
        return 10
    }
    print("success1\n")
    return 0
}

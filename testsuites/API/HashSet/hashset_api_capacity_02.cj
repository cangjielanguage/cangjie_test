// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var str:List<String> = ["a","b","c"]
    var r1:HashSet<String> = HashSet<String>()
    var r2:HashSet<String> = HashSet<String>(["a","b","c"])
    var r3:HashSet<String> = HashSet<String>(str)
    var r4:HashSet<String> = HashSet<String>(3)
    var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})
    var list1:List<String> = ["d","e","f","g","h","i","j","k","l","m","n","x","y","z","u","v","w"]
    r1.putAll(list1)
    r2.putAll(list1)
    r3.putAll(list1)
    r4.putAll(list1)
    r5.putAll(list1)
    if (r1.capacity()!=32){
       return 1
    }
    if (r2.capacity()!=32){
       return 2
    }
    if (r3.capacity()!=32){
       return 3
    }
    if( r4.capacity()!=32){
       return 4
    }
    if( r5.capacity()!=32){
       return 5
    }
    print("success1\n")
    return 0
}

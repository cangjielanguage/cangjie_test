// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args| compare %f
// ASSERT: scan success1

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:HashSet<Int64> = HashSet<Int64>()
var r2:HashSet<String> = HashSet<String>(["0","2","1"])
var r3:HashSet<String> = HashSet<String>(str)
var r4:HashSet<String> = HashSet<String>(3)
var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})

func main(): Int64 {
    r1.reserve(17)
    r1.reserve(17)
    r2.reserve(17)
    r2.reserve(17)
    r5.reserve(17)
    r5.reserve(17)
    if(r1.capacity()!=32)
    {
        return 1
    }
    if(r2.capacity()!=32)
    {
        return 2
    }
    if(r5.capacity()!=32)
    {
        return 3
    }
    print("success1\n")
    return 0
}
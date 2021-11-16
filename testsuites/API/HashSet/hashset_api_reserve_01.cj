// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:HashSet<Int64> = HashSet<Int64>()
var r2:HashSet<String> = HashSet<String>(["0","2","1"])
var r3:HashSet<String> = HashSet<String>(str)
var r4:HashSet<String> = HashSet<String>(3)
var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})

func main(): Int64 {
    r1.reserve(5)
    r2.reserve(14)
    r3.reserve(13)
    r4.reserve(3)
    r5.reserve(11)
    if(r1.capacity()!=16)//计算之后不超过16
    {
        return 1
    }
    if(r2.capacity()!=32)//超过16
    {
        return 2
    }
    if(r3.capacity()!=16)//计算之后等于16
    {
        return 3
    }
    if(r4.capacity()!=16)//初始化设置容量，加容量
    {
        return 4
    }
    if(r5.capacity()!=16)//初始化设置容量，加容量,计算之后不超过16
    {
        return 5
    }
     print("success1\n")
    return 0
}

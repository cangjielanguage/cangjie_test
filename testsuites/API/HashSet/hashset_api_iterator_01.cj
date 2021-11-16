// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var str:List<String> = ["a","b","c"]
    var r1:HashSet<Int64> = HashSet<Int64>()
    var r2:HashSet<String> = HashSet<String>(["0","2","1"])
    var r3:HashSet<String> = HashSet<String>(str)
    var r4:HashSet<String> = HashSet<String>(3)
    var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})
    var itor01=r1.iterator()
    var itor02=r2.iterator()
    var itor03=r3.iterator()
    var itor04=r4.iterator()
    var itor05=r5.iterator()
    if(itor01.hasNext()==true)
    {
         return 1
    }
    if(itor02.hasNext()!=true)
    {
        return 1
    }
    if(itor03.hasNext()!=true)
    {
        return 3
    }
    if(itor04.hasNext()==true)
    {
        return 4
    }
    if(itor05.hasNext()!=true)
    {
        return 5
    }
    print("success1\n")
    return 0
}
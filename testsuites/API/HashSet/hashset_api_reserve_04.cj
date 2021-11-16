// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan Exception1
// ASSERT: scan Exception2
// ASSERT: scan Exception3
// ASSERT: scan success

from std import collection.*

func main(): Int64 {
    var str:List<String> = ["a","b","c"]
    var r2:HashSet<String> = HashSet<String>(["0","2","1"])
    var r3:HashSet<String> = HashSet<String>(str)
    var r5:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})
    try{
        r2.reserve(9223372036854775805)
    }catch(e:Exception)
    {
        print("Exception1\n")
    }
    try{
        r3.reserve(9223372036854775805)
    }catch(e:Exception)
    {
        print("Exception2\n")
    }
    try{
        r5.reserve(9223372036854775805)
    }catch(e:Exception)
    {
        print("Exception3\n")
    }

    if(r2.capacity()!=16)
    {
        return 1
    }
    if(r3.capacity()!=16)
    {
        return 2
    }
    if(r5.capacity()!=16)
    {
        return 3
    }
    print("success\n")
    return 0
}
// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

var str1:List<String> = ["a","b"]
var str2:String = "c"
var r1:HashSet<String> = HashSet<String>(str1)

func test(x:HashSet<String>):HashSet<String>
{
     x.put(str2)
     return x
}

func main(): Int64 {
    test(r1)
    if (r1.size()!=3)
    {
        return 1
    }
    if (r1.contains(str1[0])!=true)
    {
        return 2
    }
    if (r1.contains(str1[1])!=true)
    {
        return 3
    }
    if (r1.contains(str2)!=true)
    {
        return 4
    }
    if (r1.capacity()!=16)
    {
        return 5
    }
     print("success1\n")
    return 0
}
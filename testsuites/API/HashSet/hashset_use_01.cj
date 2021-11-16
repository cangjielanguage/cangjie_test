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
    print("success1\n")
    return 0
}
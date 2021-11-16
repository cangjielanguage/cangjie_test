// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args| compare %f
// ASSERT: scan success1
// ASSERT: scan-not fail1

from std import collection.*

func main(): Int64 {
    var str:List<String> = ["a","b","c"]
    var r1:HashSet<Int64> = HashSet<Int64>()
    r1.reserve(-9223372036854775808)
    if(r1.capacity()!=16)
    {
        print("fail1\n")
        return 1
    }
    print("success1\n")
    return 0
}

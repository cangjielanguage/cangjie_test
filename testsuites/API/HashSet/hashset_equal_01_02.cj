// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var r1:HashSet<String> = HashSet<String>()
    var r2:HashSet<String> = HashSet<String>()
    if (r1!=r2)
    {
        return 1
    }
     print("success1\n")
    return 0
}
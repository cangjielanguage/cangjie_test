// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var r4:HashSet<String> = HashSet<String>(3)
    r4.reserve(30)
    if (r4.capacity()!=32){
        return 1
    }
    print("success1\n")
    return 0
}

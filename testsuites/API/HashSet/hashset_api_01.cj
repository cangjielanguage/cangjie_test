// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var hashset:HashSet<Int64> = HashSet<Int64>()
    if (hashset.size() != 0 ){
        return 1
    }
    if (hashset.isEmpty() != true ){
        return 2
    }
    print("success1\n")
    return 0
}

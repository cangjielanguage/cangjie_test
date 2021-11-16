// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args |compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    try
    {
        var r1:HashSet<String> = HashSet<String>(-3)
        if ( r1.size() != 0 ){
            return 1
        }
    }
    catch(e:IllegalArgumentException)
    {
         print("success1\n")
    }
    return 0
}

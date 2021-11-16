// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var r1:HashSet<String> = HashSet<String>(3,{x:Int64=>x.toString()})
    var r2:HashSet<String> = HashSet<String>(["0","2","1"])
    if (r1.size() != 3 ){
        return 1
    }
    if(r1.containsAll(r2) != true)
    {
       return 2
    }
    if(r2.containsAll(r1) != true)
    {
       return 3
    }
    print("success1\n")
    return 0
}

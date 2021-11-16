// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

func main(): Int64 {
    var r1:HashSet<String> = HashSet<String>()
    var r4:HashSet<String> = HashSet<String>(3)
    r1.clear()
    r4.clear()
    var it1=r1.iterator()
    var it4=r4.iterator()
    if (it4.hasNext()==true){
       return 1
    }
    if (it1.hasNext()==true){
       return 2
    }
    if (r1.size()!=0){
       return 3
    }
    if (r4.size()!=0){
       return 4
    }
    print("success1\n")
    return 0
}
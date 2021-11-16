// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args| compare %f
// ASSERT: scan success1

from std import collection.*

var str:ArrayList<Int64>=ArrayList<Int64>([1])
var r1= HashSet<Int64>([1])
var r2= HashSet<Int64>(str)

func main(): Int64 {
    if (r1.size()!=1){
       return 1
    }
    if (r1.contains(1)!=true){
       return 2
    }
    if (r1.capacity()!=16){
       return 3
    }
    if (r2.size()!=1){
       return 4
    }
    if (r2.contains(1)!=true){
       return 5
    }
    if (r2.capacity()!=16){
       return 6
    }
    print("success1\n")
    return 0
}
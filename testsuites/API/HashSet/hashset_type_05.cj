// EXEC-PIPE: %compiler %stdx_cmp_opt %f -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args|compare %f
// ASSERT: scan success1

from std import collection.*

var range1: List<Range<Int64>>= [0..10,0..5]
var r1:HashSet<Range<Int64>> = HashSet<Range<Int64>>(range1)
var r2:HashSet<Range<Int64>> = HashSet<Range<Int64>>([0..10,0..5])

func main(): Int64 {
    if (r1.size()!=2){
       return 1
    }
    if (r1.contains(0..5)!=true){
       return 2
    }
    if (r1.contains(0..10)!=true){
       return 3
    }
    if (r2.size()!=2){
       return 4
    }
    if (r2.contains(0..5)!=true){
       return 5
    }
    if (r2.contains(0..10)!=true){
       return 6
    }
     print("success1\n")
    return 0
}

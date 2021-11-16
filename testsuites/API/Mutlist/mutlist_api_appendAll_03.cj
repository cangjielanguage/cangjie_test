// EXEC: %compiler  %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var r1:Buffer<String> = Buffer<String>(3)
var r2:Buffer<String> = Buffer<String>(["1","2","3","4","5"])

func main(): Int64 {
    r1.addAll(r2)
    if(r1[0]!="1")
    {
       return 1
    }
    if(r1[1]!="2")
    {
       return 2
    }
    if(r1[2]!="3")
    {
       return 3
    }
    if(r1[3]!="4")
    {
       return 4
    }
    if(r1[4]!="5")
    {
       return 5
    }
    if(r1.size()!=5)
    {
       return 6
    }
    return 0
}

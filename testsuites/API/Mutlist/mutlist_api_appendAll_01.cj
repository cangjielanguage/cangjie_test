// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var str:List<String> = ["a","b","c"]
var r1:Buffer<String> = Buffer<String>(str)
var r2:Buffer<String> = Buffer<String>(["a","b","c"])

func main(): Int64 {
    r1.addAll(r2)
    if(r1[3]!=r2[0])
    {
       return 1
    }
    if(r1[4]!=r2[1])
    {
       return 2
    }
    if(r1[5]!=r2[2])
    {
       return 3
    }
    if(r1.size()!=6)
    {
       return 4
    }
    return 0
}

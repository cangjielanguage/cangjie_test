// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

func main(): Int64 {
   var r1:Buffer<String> = Buffer<String>(["a","b","c"])
   r1.insert(Int64(3),"t")
   if(r1.size()!=4)
   {
        return 1
   }
   return 0
}

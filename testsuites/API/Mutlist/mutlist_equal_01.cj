// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var list1:List<String> = ["a","b","c"]
var r1:Buffer<String> = Buffer<String>(list1)
var r2:Buffer<String> = Buffer<String>(list1)

var list2:List<Int8> = [1,2,3]
var r3:Buffer<Int8> = Buffer<Int8>(list2)
var r4:Buffer<Int8> = Buffer<Int8>(list2)

func main(): Int64 {
   for (i in 0..r1.size())
   {
      if(r1[i]==r2[i])
      {
          return 0
      }
      if(r3[i]==r4[i])
      {
          return 0
      }
   }
   if(r1==r2)
   {
       return 0
   }
   if(r1==r2)
   {
       return 0
   }
   return 1
}

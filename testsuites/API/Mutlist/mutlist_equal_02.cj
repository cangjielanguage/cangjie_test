// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*

var list1:List<String> = ["a","b","c"]
var list2:List<String> = ["a","f","c"]
var r1:Buffer<String> = Buffer<String>(list1)
var r2:Buffer<String> = Buffer<String>(list2)

var list3:List<Int8> = [1,2,3]
var list4:List<Int8> = [2,2,3]
var r3:Buffer<Int8> = Buffer<Int8>(list3)
var r4:Buffer<Int8> = Buffer<Int8>(list4)

func main(): Int64 {
      if(r1[1]!=r2[1])
      {
          return 0
      }
      if(r3[0]!=r4[0])
      {
          return 0
      }
      if(r1!=r2)
      {
          return 0
      }
      if(r3!=r4)
      {
          return 0
      }
   return 1
}

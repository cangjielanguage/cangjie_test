// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*
func main()
{
   var r=Random()
   var seed:UInt64=9
   r.setSeed(seed)
   var arraylist= Array<UInt8>([2,3,4,5,6,7,7])
   var empty_array= Array<UInt8>()
   var arraysize=arraylist.size()
   var emptysize=empty_array.size()
   for(i in 0..88)
   {
        var arraylist2=r.nextUInt8s(arraylist)
        for(j in arraylist2)
        {
           if(j is UInt8)
           {
              if(arraylist2.size()!=arraysize)
              {
                  print("array is wrong\n")
                  return 1

              }
           }else{
               print("array is not utf-8\n")
               return 2
           }
        }
   }
   for(i in 0..300)
   {
        var empty_array2=r.nextUInt8s(empty_array)
        if(empty_array2.size()!=emptysize)
        {
             return 3
        }
   }
   print("success\n")
   return 0
}
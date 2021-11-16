// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

from std import util.*
func main()
{
   var seed:UInt64=15
   var r=Random(seed)
   var arraylist= Array<UInt8>([9,3,4,5,6,7,7])
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
               return 3
           }
        }
   }
   for(i in 0..300)
   {
        var empty_array2=r.nextUInt8s(empty_array)
        if(empty_array2.size()!=emptysize)
        {
             return 2
        }

   }

   print("success\n")
   return 0
}
// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   //Int8
   var val_int8: Int8 = -128
   if (abs(val_int8) != -128) {
		return 1
   }

   var val_int16: Int16 = -32768
   if (abs(val_int16) != -32768) {
		return 1
   }
   
   var val_int32: Int32 = -2147483648
   if (abs(val_int32) != -2147483648) {
		return 1
   }

   var val_int64: Int64 = -9223372036854775808
   if (abs(val_int64) != -9223372036854775808) {
		return 1
   }
   
//print(abs(val_int64).toString()+"\n")


   return 0

}
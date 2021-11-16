// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

import math.*

func main(): Int64{

   var v_f32: Float32 = 4.4E38


   if (!isInf(v_f32)) {
       return 1
   }

   if (!isInf(Float64(v_f32))) {
       return 1
   }


   var v_int32: Int32 = 2147483647
   var v_int64: Int64 = 9223372036854775807


   if (!isInf(Float16(v_int32))) {
       return 1
   }


   if (!isInf(Float16(v_int64))) {
       return 1
   }


   var v_uint16: UInt16 = 65535
   var v_uint32: UInt32 = 4294967295
   var v_uint64: UInt64 = 18446744073709551615

   //print(Float16(v_uint32).toString() + "\n")

   if (!isInf(Float16(v_uint16))) {
       return 1
   }

   if (!isInf(Float16(v_uint32))) {
       return 1
   }

   if (!isInf(Float16(v_uint64))) {
       return 1
   }

   return 0

}
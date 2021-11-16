// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import math.*

func main(): Int64{

   print("${MIN_INT64}\n")
   print("${MAX_UINT64}\n")


   if ("${MAX_INT64}" != "9223372036854775807" ) {
      return 1
   }

   if ("${MIN_INT64}" != "-9223372036854775808" ) {
      return 1
   }

   if ("${MAX_INT32}" != "2147483647" ) {
      return 1
   }

   if (MIN_INT32 != -2147483648) {
      return 1
   }

   if ("${MAX_INT16}" != "32767" ) {
      return 1
   }

   if (MIN_INT16 != -32768) {
      return 1
   }

   if (MAX_INT8 != 127) {
      return 1
   }

   if (MIN_INT8.toString() != "-128") {
      return 1
   }

   if (MAX_UINT64 != 18446744073709551615) {
      return 1
   }

   if (MAX_UINT32 != 4294967295) {
      return 1
   }

   if (MAX_UINT16 != 65535) {
      return 1
   }

   if (MAX_UINT8 != 255) {
      return 1
   }

   return 0

}

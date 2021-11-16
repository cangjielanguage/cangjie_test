// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import math.*

func main(): Int64{

   var v_u8_1: UInt8 = 0
   var v_u8_2: UInt8 = 1
   var v_u8_3: UInt8 = 255
   var v_u8_4: UInt8 = 49

   if (leadingZeros(v_u8_1) != 8) {
       return 1
   }

   if (leadingZeros(v_u8_2) != 7) {
       return 1
   }

   if (leadingZeros(v_u8_3) != 0) {
       return 1
   }

   if (leadingZeros(v_u8_4) != 2) {
       return 1
   }



   var v_u16_1: UInt16 = 0
   var v_u16_2: UInt16 = 1
   var v_u16_3: UInt16 = 65535
   var v_u16_4: UInt16 = 49


   if (leadingZeros(v_u16_1) != 16) {
       return 1
   }

   if (leadingZeros(v_u16_2) != 15) {
       return 1
   }

   if (leadingZeros(v_u16_3) != 0) {
       return 1
   }

   if (leadingZeros(v_u16_4) != 10) {
       return 1
   }



   var v_u32_1: UInt32 = 0
   var v_u32_2: UInt32 = 1
   var v_u32_3: UInt32 = 4294967295
   var v_u32_4: UInt32 = 49

   if (leadingZeros(v_u32_1) != 32) {
       return 1
   }

   if (leadingZeros(v_u32_2) != 31) {
       return 1
   }

   if (leadingZeros(v_u32_3) != 0) {
       return 1
   }

   if (leadingZeros(v_u32_4) != 26) {
       return 1
   }



   var v_u64_1: UInt64 = 0
   var v_u64_2: UInt64 = 1
   var v_u64_3: UInt64 = 18446744073709551615
   var v_u64_4: UInt64 = 49

   if (leadingZeros(v_u64_1) != 64) {
       return 1
   }

   if (leadingZeros(v_u64_2) != 63) {
       return 1
   }

   if (leadingZeros(v_u64_3) != 0) {
       return 1
   }

   if (leadingZeros(v_u64_4) != 58) {
       return 1
   }

   return 0

}
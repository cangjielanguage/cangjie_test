// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import math.*

func main(): Int64{

   var v_u8_1: UInt8 = 0
   var v_u8_2: UInt8 = 1
   var v_u8_3: UInt8 = 128
   var v_u8_4: UInt8 = 255
   var v_u8_5: UInt8 = 56

   if (trailingZeros(v_u8_1) != 8) {
       return 1
   }

   if (trailingZeros(v_u8_2) != 0) {
       return 1
   }

   if (trailingZeros(v_u8_3) != 7) {
       return 1
   }

   if (trailingZeros(v_u8_4) != 0) {
       return 1
   }

   if (trailingZeros(v_u8_5) != 3) {
       return 1
   }



   var v_u16_1: UInt16 = 0
   var v_u16_2: UInt16 = 1
   var v_u16_3: UInt16 = 32768
   var v_u16_4: UInt16 = 65535
   var v_u16_5: UInt8 = 56

   if (trailingZeros(v_u16_1) != 16) {
       return 1
   }

   if (trailingZeros(v_u16_2) != 0) {
       return 1
   }

   if (trailingZeros(v_u16_3) != 15) {
       return 1
   }

   if (trailingZeros(v_u16_4) != 0) {
       return 1
   }

   if (trailingZeros(v_u16_5) != 3) {
       return 1
   }



   var v_u32_1: UInt32 = 0
   var v_u32_2: UInt32 = 1
   var v_u32_3: UInt32 = 2147483648
   var v_u32_4: UInt32 = 4294967295
   var v_u32_5: UInt32 = 56

   if (trailingZeros(v_u32_1) != 32) {
       return 1
   }

   if (trailingZeros(v_u32_2) != 0) {
       return 1
   }

   if (trailingZeros(v_u32_3) != 31) {
       return 1
   }

   if (trailingZeros(v_u32_4) != 0) {
       return 1
   }

   if (trailingZeros(v_u32_5) != 3) {
       return 1
   }



   var v_u64_1: UInt64 = 0
   var v_u64_2: UInt64 = 1
   var v_u64_3: UInt64 = 9223372036854775808
   var v_u64_4: UInt64 = 18446744073709551615
   var v_u64_5: UInt64 = 56

   if (trailingZeros(v_u64_1) != 64) {
       return 1
   }

   if (trailingZeros(v_u64_2) != 0) {
       return 1
   }

   if (trailingZeros(v_u64_3) != 63) {
       return 1
   }

   if (trailingZeros(v_u64_4) != 0) {
       return 1
   }

   if (trailingZeros(v_u64_5) != 3) {
       return 1
   }

   return 0

}
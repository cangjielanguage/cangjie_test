// EXEC: echo math=%libdir/math/math.cjo> math.cfg
// EXEC: %compiler -i math.cfg %libdir/math/cangjieMath.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import math.*

func main(): Int64{

   var v_u8_1: UInt8 = 0
   var v_u8_2: UInt8 = 1
   var v_u8_3: UInt8 = 255
   var v_u8_4: UInt8 = 24
   var v_u8_5: UInt8 = 28

   if (reverse(v_u8_1) != 0) {
       return 1
   }

   if (reverse(v_u8_2) != 128) {
       return 1
   }

   if (reverse(v_u8_3) != 255) {
       return 1
   }

   if (reverse(v_u8_4) != 24) {
       return 1
   }

   if (reverse(v_u8_5) != 56) {
       return 1
   }


   var v_u16_1: UInt16 = 0
   var v_u16_2: UInt16 = 1
   var v_u16_3: UInt16 = 65535
   var v_u16_4: UInt16 = 384
   var v_u16_5: UInt16 = 896

   if (reverse(v_u16_1) != 0) {
       return 1
   }

   if (reverse(v_u16_2) != 32768) {
       return 1
   }

   if (reverse(v_u16_3) != 65535) {
       return 1
   }

   if (reverse(v_u16_4) != 384) {
       return 1
   }

   if (reverse(v_u16_5) != 448) {
       return 1
   }



   var v_u32_1: UInt32 = 0
   var v_u32_2: UInt32 = 1
   var v_u32_3: UInt32 = 4294967295
   var v_u32_4: UInt32 = 98304
   var v_u32_5: UInt32 = 229376

   if (reverse(v_u32_1) != 0) {
       return 1
   }

   if (reverse(v_u32_2) != 2147483648) {
       return 1
   }

   if (reverse(v_u32_3) != 4294967295) {
       return 1
   }

   if (reverse(v_u32_4) != 98304) {
       return 1
   }

   if (reverse(v_u32_5) != 114688) {
       return 1
   }



   var v_u64_1: UInt64 = 0
   var v_u64_2: UInt64 = 1
   var v_u64_3: UInt64 = 18446744073709551615
   var v_u64_4: UInt64 = 16106127360
   var v_u64_5: UInt64 = 8321499136

   if (reverse(v_u64_1) != 0) {
       return 1
   }

   if (reverse(v_u64_2) != 9223372036854775808) {
       return 1
   }

   if (reverse(v_u64_3) != 18446744073709551615) {
       return 1
   }

   if (reverse(v_u64_4) != 16106127360) {
       return 1
   }

   if (reverse(v_u64_5) != 66571993088) {
       return 1
   }

   return 0

}
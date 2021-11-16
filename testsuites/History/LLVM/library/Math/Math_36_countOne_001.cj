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

   if (countOne(v_u8_1) != 0) {
       return 1
   }

   if (countOne(v_u8_2) != 1) {
       return 1
   }

   if (countOne(v_u8_3) != 1) {
       return 1
   }

   if (countOne(v_u8_4) != 8) {
       return 1
   }

   if (countOne(v_u8_5) != 3) {
       return 1
   }


   var v_u16_1: UInt16 = 0
   var v_u16_2: UInt16 = 1
   var v_u16_3: UInt16 = 32768
   var v_u16_4: UInt16 = 65535
   var v_u16_5: UInt16 = 4321

   if (countOne(v_u16_1) != 0) {
       return 1
   }

   if (countOne(v_u16_2) != 1) {
       return 1
   }

   if (countOne(v_u16_3) != 1) {
       return 1
   }

   if (countOne(v_u16_4) != 16) {
       return 1
   }

   if (countOne(v_u16_5) != 5) {
       return 1
   }



   var v_u32_1: UInt32 = 0
   var v_u32_2: UInt32 = 1
   var v_u32_3: UInt32 = 2147483648
   var v_u32_4: UInt32 = 4294967295
   var v_u32_5: UInt32 = 6553789



   if (countOne(v_u32_1) != 0) {
       return 1
   }

   if (countOne(v_u32_2) != 1) {
       return 1
   }

   if (countOne(v_u32_3) != 1) {
       return 1
   }

   if (countOne(v_u32_4) != 32) {
       return 1
   }

   if (countOne(v_u32_5) != 9) {
       return 1
   }



   var v_u64_1: UInt64 = 0
   var v_u64_2: UInt64 = 1
   var v_u64_3: UInt64 = 9223372036854775808
   var v_u64_4: UInt64 = 18446744073709551615
   var v_u64_5: UInt64 = 12345678909876



   if (countOne(v_u64_1) != 0) {
       return 1
   }

   if (countOne(v_u64_2) != 1) {
       return 1
   }

   if (countOne(v_u64_3) != 1) {
       return 1
   }

   if (countOne(v_u64_4) != 64) {
       return 1
   }

   if (countOne(v_u64_5) != 24) {
       return 1
   }

   return 0

}
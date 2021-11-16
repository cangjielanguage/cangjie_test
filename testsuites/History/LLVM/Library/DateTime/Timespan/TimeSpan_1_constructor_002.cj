// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{
   let ts0 = TimeSpan(0b1101101001000111011001101010101011000010000000)
   var ts1 = TimeSpan(-0o1551073152530200) //-60000050000000
   var ts2 = TimeSpan(0x3691D9AAB080)
   var ts3 = TimeSpan(60_0000_5000_0000)

   if (ts0.toString() != "69.10:40:05") {
       return 1
   }

   if (ts1.toString() != "-69.10:40:05") {
       return 1
   }

   if (ts2.toString() != "69.10:40:05") {
       return 1
   }

   if (ts3.toString() != "69.10:40:05") {
       return 1
   }

   return 0

}

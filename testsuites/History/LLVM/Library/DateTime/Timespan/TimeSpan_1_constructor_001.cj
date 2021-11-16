// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{
   let ts0 = TimeSpan(0)
   var ts1 = TimeSpan(-60000050000000)
   var ts2 = TimeSpan(60000050000000)
   var ts3 = TimeSpan(-9223372036854775808)
   var ts4 = TimeSpan(9223372036854775807)

   if (ts0.toString() != "00:00:00") {
       return 1
   }

   if (ts1.toString() != "-69.10:40:05") {
       return 1
   }

   if (ts2.toString() != "69.10:40:05") {
       return 1
   }

   if ("${ts3}" != "-10675199.02:48:05.477" ) {
       return 1
   }

   if ("${ts4}" != "10675199.02:48:05.477") {
       return 1
   }

   return 0

}

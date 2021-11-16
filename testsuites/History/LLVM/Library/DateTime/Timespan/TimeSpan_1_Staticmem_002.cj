// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   if ("${TimeSpan.MinValue().toString()}" != "-10675199.02:48:05.477" ) {
       return 1
   }

   if (TimeSpan.MinValue().Days().toString() != "-10675199") {
       return 1
   }

   if (TimeSpan.MinValue().Hours() != -2) {
       return 1
   }

   if ("${TimeSpan.MinValue().Minutes()}" != "-48" ) {
       return 1
   }

   if ("${TimeSpan.MinValue().Seconds()}" != "-5") {
       return 1
   }

   if (TimeSpan.MinValue().Milliseconds().toString() != "-477") {
       return 1
   }

   if (TimeSpan.MinValue().GetTicks() != -9223372036854775808) {
       return 1
   }

   return 0

}

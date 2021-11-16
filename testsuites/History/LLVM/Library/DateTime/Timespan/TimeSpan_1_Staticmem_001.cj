// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   if ("${TimeSpan.MaxValue().toString()}" != "10675199.02:48:05.477" ) {
       return 1
   }

   if (TimeSpan.MaxValue().Days().toString() != "10675199") {
       return 1
   }

   if (TimeSpan.MaxValue().Hours() != 2) {
       return 1
   }

   if ("${TimeSpan.MaxValue().Minutes()}" != "48" ) {
       return 1
   }

   if ("${TimeSpan.MaxValue().Seconds()}" != "5") {
       return 1
   }

   if (TimeSpan.MaxValue().Milliseconds().toString() != "477") {
       return 1
   }

   if (TimeSpan.MaxValue().GetTicks() != 9223372036854775807) {
       return 1
   }

   return 0

}

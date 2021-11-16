// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   if (TimeSpan.Zero().toString() != "00:00:00") {
       return 1
   }

   if (TimeSpan.TicksPerDay != 864000000000) {
       return 1
   }

   if ("${TimeSpan.TicksPerHour}" != "36000000000" ) {
       return 1
   }

   if ("${TimeSpan.TicksPerMillisecond}" != "10000") {
       return 1
   }

   if (TimeSpan.TicksPerMinute.toString() != "600000000") {
       return 1
   }

   if (TimeSpan.TicksPerSecond != 10000000) {
       return 1
   }

   return 0

}

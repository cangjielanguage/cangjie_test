// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   let ts0 = TimeSpan(100,49,1439,3601,10020)

   if (ts0.TotalDays() - 103.082766 > 0.000001) {
       return 1
   }

   if (ts0.TotalHours() - 2473.986394 > 0.000001) {
       return 1
   }

   if (ts0.TotalMinutes() - 148439.183667 > 0.000001){
       return 1
   }

   if ("${ts0.TotalSeconds()}" != "8906351.020000") {
       return 1
   }

   if ("${ts0.TotalMilliseconds()}" != "8906351020.000000") {
             return 1
   }

   return 0

}

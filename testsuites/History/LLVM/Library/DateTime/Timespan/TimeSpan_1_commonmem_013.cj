// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   let ts1: TimeSpan = TimeSpan(21,19,50)
   var ts2: TimeSpan = TimeSpan(30,06,15,50)
   var ts3: TimeSpan = TimeSpan(10,13,53,30,123)
   let ts4: TimeSpan = TimeSpan(600000000)

   if (ts3.Subtract(TimeSpan(17,43,58)).Days().toString() != "9") {
       return 1
   }

   if (ts3.Subtract(TimeSpan(17,43,58)).Hours().toString() != "20") {
       return 1
   }

   if (ts3.Subtract(TimeSpan(17,43,58)).Minutes().toString() != "9") {
       return 1
   }

   if (ts3.Subtract(TimeSpan(17,43,58)).Seconds().toString() != "32") {
       return 1
   }

   if (ts3.Subtract(TimeSpan(17,43,58)).Milliseconds().toString() != "123") {
       return 1
   }

   if (ts3.Subtract(TimeSpan(17,43,58)).GetTicks().toString() != "8501721230000") {
       return 1
   }

   return 0

}

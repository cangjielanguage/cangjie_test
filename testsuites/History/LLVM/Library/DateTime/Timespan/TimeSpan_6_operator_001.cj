// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   let ts1: TimeSpan = TimeSpan(21,19,50)
   var ts2: TimeSpan = TimeSpan(30,06,15,50)
   var ts3: TimeSpan = TimeSpan(10,13,53,30,123)
   let ts4: TimeSpan = TimeSpan(600000000)

   var ts11: TimeSpan = ts1 + ts1
   var ts22: TimeSpan = ts2 + ts2
   var ts33: TimeSpan = ts3 + ts3
   var ts44: TimeSpan = ts4 + ts4

   var ts1234: TimeSpan = ts1 + ts2 + ts3 + ts4
   var ts4321: TimeSpan = ts4 + (ts3 + (ts2 + ts1))


   if (ts11.toString() != "01.18:39:40") {
       return 1
   }

   if (ts22.toString() != "60.12:31:40") {
       return 1
   }

   if (ts33.toString() != "21.03:47:00.246") {
       return 1
   }

   if (ts44.toString() != "00:02:00") {
       return 1
   }

   if (ts1234 != ts4321) {
       return 1
   }

   if ("${ts1 + ts2 + ts3 + ts4}" != "41.17:30:10.123" ) {
       return 1
   }

   if ("${ts4 + (ts3 + (ts2 + ts1))}" != "41.17:30:10.123" ) {
       return 1
   }

   if ("${TimeSpan(21,19,50) + TimeSpan(30,06,15,50) + TimeSpan(10,13,53,30,123) + TimeSpan(600000000)}" != "41.17:30:10.123" ) {
       return 1
   }

   if (ts1.toString() != "21:19:50") {
       return 1
   }

   if (ts2.toString() != "30.06:15:50") {
       return 1
   }

   if (ts3.toString() != "10.13:53:30.123") {
       return 1
   }

   if (ts4.toString() != "00:01:00") {
       return 1
   }

   return 0

}

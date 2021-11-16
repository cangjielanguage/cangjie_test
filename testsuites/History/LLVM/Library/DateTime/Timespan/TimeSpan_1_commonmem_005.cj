// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   let ts1: TimeSpan = TimeSpan(21,19,50)
   var ts2: TimeSpan = TimeSpan(-30,06,-15,50)
   var ts3: TimeSpan = TimeSpan(31,-13,53,30,-123)
   let ts4: TimeSpan = TimeSpan(-600000000)

   var ts11: TimeSpan = ts1.Add(ts1)
   var ts22: TimeSpan = ts2.Add(-ts2)
   var ts33: TimeSpan = ts3.Add(ts3)
   var ts44: TimeSpan = ts4.Add(-ts4)

   var ts1234: TimeSpan = ts1.Add(ts2).Add(ts3).Add(ts4)
   var ts4321: TimeSpan = ts4.Add(ts3.Add(ts2.Add(ts1)))


   if (ts11.toString() != "01.18:39:40") {
       return 1
   }

   if (ts22.toString() != "00:00:00") {
       return 1
   }

   if (ts33.toString() != "60.23:46:59.754") {
       return 1
   }

   if (ts44.toString() != "00:00:00") {
       return 1
   }

   if (ts1234 != ts4321) {
       return 1
   }

   if ("${ts1.Add(ts2).Add(ts3).Add(ts4)}" != "01.14:58:09.877" )  {
       return 1
   }

   if ("${ts4.Add(ts3.Add(ts2.Add(ts1)))}" != "01.14:58:09.877" )  {
       return 1
   }

   return 0

}

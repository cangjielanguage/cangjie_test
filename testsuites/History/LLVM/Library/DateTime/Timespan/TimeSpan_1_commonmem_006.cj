// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args
import datetime.*

func main(): Int64{

   let ts1: TimeSpan = TimeSpan(21,19,50)
   var ts2: TimeSpan = TimeSpan(30,06,15,50)
   var ts3: TimeSpan = TimeSpan(10,13,53,30,123)
   let ts4: TimeSpan = TimeSpan(600000000)

   var ts1234: TimeSpan = ts1.Add(ts2).Add(ts3).Add(ts4)
   var ts4321: TimeSpan = ts4.Add(ts3.Add(ts2.Add(ts1)))

   if (ts1.Add(ts2).Add(ts3).Add(ts4).Days().toString() != "41") {
       return 1
   }

   if (ts4.Add(ts3.Add(ts2.Add(ts1))).Hours().toString() != "17" ) {
       return 1
   }

   if ("${ts1.Add(ts2).Add(ts3).Add(ts4).Minutes()}" != "30" )  {
       return 1
   }

   if ("${ts1.Add(ts2).Add(ts3).Add(ts4).Seconds()}" != "10") {
       return 1
   }

   if (ts4.Add(ts3.Add(ts2.Add(ts1))).Milliseconds() != 123) {
       return 1
   }

   if (ts1.Add(ts2).Add(ts3).Add(ts4).GetTicks() != 36054101230000) {
       return 1
   }

   if (ts1.Add(ts2).Add(ts3).Add(ts4).TotalDays() - 41.729283 > 0.000001) {
       return 1
   }

   if (ts4.Add(ts3.Add(ts2.Add(ts1))).TotalHours() - 1001.502811 > 0.000001) {
       return 1
   }

   if (ts1.Add(ts2).Add(ts3).Add(ts4).TotalMinutes() - 60090.168716 > 0.000001) {
       return 1
   }

   if (ts1.Add(ts2).Add(ts3).Add(ts4).TotalSeconds() - 3605410.123 > 0.001) {
       return 1
   }

   if (ts4.Add(ts3.Add(ts2.Add(ts1))).TotalMilliseconds() != 3605410123.0) {
       return 1
   }

   return 0

}

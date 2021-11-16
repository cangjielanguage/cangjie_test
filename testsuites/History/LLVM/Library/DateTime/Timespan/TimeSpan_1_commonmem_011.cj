// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   var ts1: TimeSpan = TimeSpan(-10,10,-24,10,-123)

   if (ts1.Negate().toString() != "09.14:23:50.123") {
       return 1
   }

   if (ts1.Negate().Days().toString() != "9") {
       return 1
   }

   if (ts1.Negate().Hours().toString() != "14") {
       return 1
   }

   if (ts1.Negate().Minutes().toString() != "23") {
       return 1
   }

   if (ts1.Negate().Seconds().toString() != "50") {
       return 1
   }

   if (ts1.Negate().Milliseconds().toString() != "123") {
       return 1
   }

   if (ts1.Negate().GetTicks().toString() != "8294301230000") {
       return 1
   }

   if (ts1.Negate().TotalDays() - 9.599885 > 0.000001 ) {
       return 1
   }

   if (ts1.Negate().TotalHours() - 230.397256 > 0.000001 ) {
       return 1
   }

   if (ts1.Negate().TotalMinutes() - 13823.835383 > 0.000001) {
       return 1
   }

   if (ts1.Negate().TotalSeconds() - 829430.123 > 0.001) {
       return 1
   }

   if (ts1.Negate().TotalMilliseconds() != 829430123.0) {
       return 1
   }

   if (ts1.Negate().Add(TimeSpan(1,1,1,1,1)).toString() != "10.15:24:51.124") {
       return 1
   }

   if (ts1.Negate().CompareTo(TimeSpan(1,1,1,1,1)).toString() != "1") {
       return 1
   }

   if (ts1.Negate().Equals(TimeSpan(10,51,24,51,124)).toString() != "false") {
       return 1
   }

   print(ts1.Negate().Add(TimeSpan(1,1,1,1,1)).toString() + "\n")

   return 0
}

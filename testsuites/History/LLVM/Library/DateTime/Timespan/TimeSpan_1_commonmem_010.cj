// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args
import datetime.*

func main(): Int64{

   let ts1: TimeSpan = TimeSpan(10,24,10)

   var ts2: TimeSpan = TimeSpan(-01,-10,-24,-10)

   var ts3: TimeSpan = TimeSpan(-10,10,-24,10,-123)

   let ts4: TimeSpan = TimeSpan(-374500000000)

   print(ts1.Negate().toString() + "\n")
   print(ts2.Negate().toString() + "\n")
   print(ts3.Negate().toString() + "\n")
   print(ts4.Negate().toString() + "\n")
   


   if (ts1.Negate().toString() != "-10:24:10") {
       return 1
   }

   if (ts2.Negate().toString() != "01.10:24:10") {
       return 1
   }

   if (ts3.Negate().toString() != "09.14:23:50.123") {
       return 1
   }

   if (ts4.Negate().toString() != "10:24:10") {
       return 1
   }

   if (TimeSpan(-10,10,-24,10,-123).Negate().Negate().Equals(ts3).toString() != "true") {
       return 1
   }

   return 0

}

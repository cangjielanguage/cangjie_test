// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   let ts11: TimeSpan = TimeSpan(10,24,10)
   let ts12: TimeSpan = TimeSpan(10,24,11)


   var ts21: TimeSpan = TimeSpan(00,10,24,10)
   var ts22: TimeSpan = TimeSpan(00,11,44,50)


   var ts31: TimeSpan = TimeSpan(00,10,24,10,000)
   var ts32: TimeSpan = TimeSpan(10,13,53,30,123)


   let ts41: TimeSpan = TimeSpan(374500000000)
   let ts42: TimeSpan = TimeSpan(600000000)


   if (ts11.CompareTo(ts21).toString() != "0") {
       return 1
   }

   if (ts21.CompareTo(ts31).toString() != "0") {
       return 1
   }

   if (ts31.CompareTo(ts41).toString() != "0") {
       return 1
   }

   if (ts41.CompareTo(ts11).toString() != "0") {
       return 1
   }

   if (ts12.CompareTo(ts21).toString() != "1") {
       return 1
   }

   if (ts12.CompareTo(ts32).toString() != "-1") {
       return 1
   }

   if (ts31.CompareTo(ts42).toString() != "1") {
       return 1
   }

   if (ts32.CompareTo(ts22).toString() != "1") {
       return 1
   }

   if (ts41.CompareTo(ts22).toString() != "-1") {
       return 1
   }


   return 0

}

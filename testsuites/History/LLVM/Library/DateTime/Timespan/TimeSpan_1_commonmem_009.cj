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


   if (ts11.Equals(ts21).toString() != "true") {
       return 1
   }

   if (ts21.Equals(ts31).toString() != "true") {
       return 1
   }

   if (ts31.Equals(ts41).toString() != "true") {
       return 1
   }

   if (ts41.Equals(ts11).toString() != "true") {
       return 1
   }

   if (TimeSpan(0,0,0).Equals(-TimeSpan(0,0,0)).toString() != "true") {
       return 1
   }

   if (TimeSpan(-0,10,24,10).Equals(ts21).toString() != "true") {
       return 1
   }

   if (ts11.Equals(ts12)) {
       return 1
   }

   if (ts12.Equals(ts21)) {
       return 1
   }

   if (ts12.Equals(ts32)) {
       return 1
   }

   if (ts22.Equals(ts21)) {
       return 1
   }

   if (ts31.Equals(ts42)) {
       return 1
   }

   if (ts31.Equals(ts32)) {
       return 1
   }

   if (ts32.Equals(ts22)) {
       return 1
   }

   if (ts41.Equals(ts22)) {
       return 1
   }

   if (ts41.Equals(ts42)) {
       return 1
   }


   return 0

}

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


   if ("${ts11 >= ts21}" != "true") {
       return 1
   }

   if ("${ts21 >= ts31}" != "true") {
       return 1
   }

   if ("${ts31 >= ts41}" != "true") {
       return 1
   }

   if ("${ts41 >= ts11}" != "true") {
       return 1
   }

   if ("${ts12 >= ts21}" != "true") {
       return 1
   }

   if (ts12 >= ts32) {
       return 1
   }

   if ("${ts31 >= ts42}" != "true") {
       return 1
   }


   if ("${ts32 >= ts22}" != "true") {
       return 1
   }

   if (ts41 >= ts22) {
       return 1
   }

   return 0

}

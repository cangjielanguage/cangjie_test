// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*



func main(): Int64{

   let ts0 = TimeSpan(267,19,14,51,66)

   if ("${ts0}" != "267.19:14:51.066" )  {
       return 1
   }

   if ("${ts0.Days()}" != "267" )  {
       return 1
   }

   if ("${ts0.Hours()}" != "19" )  {
       return 1
   }

   if (ts0.Minutes() != 14) {
       return 1
   }

   if ("${ts0.Seconds()}" != "51" )  {
       return 1
   }

   if ("${ts0.Milliseconds()}" != "66" )  {
       return 1
   }

   if ("${ts0.GetTicks()}" != "231380910660000" )  {
       return 1
   }

   return 0

}

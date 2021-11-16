// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   let ts0 = TimeSpan(19,49,3599,3601,2001)

   if ("${ts0}" != "23.13:59:03.001" )  {
       return 1
   }

   if ("${ts0.Days()}" != "23" )  {
       return 1
   }

   if ("${ts0.Hours()}" != "13" )  {
       return 1
   }

   if ("${ts0.Minutes()}" != "59" )  {
       return 1
   }

   if ("${ts0.Seconds()}" != "3" )  {
       return 1
   }

   if ("${ts0.Milliseconds()}" != "1" )  {
       return 1
   }

   if ("${ts0.GetTicks()}" != "20375430010000" )  {
       return 1
   }

   return 0

}

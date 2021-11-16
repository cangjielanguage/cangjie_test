// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   if (TimeSpan.FromDays(10675199.0).toString() != "10675199.00:00:00") {
       return 1
   }

   if (TimeSpan.FromDays(23.34).toString() != "23.08:09:36") {
       return 1
   }

   if (TimeSpan.FromDays(-10675199.0).toString() != "-10675199.00:00:00") {
       return 1
   }

   if (TimeSpan.FromHours(10675199.0).toString() != "444799.23:00:00") {
       return 1
   }

   if (TimeSpan.FromHours(23.34).toString() != "23:20:24") {
       return 1
   }

   //if (TimeSpan.FromHours(-10675199.0).toString() != "-444799.23:00:00") {
   //    return 1
   //}

   if ("${TimeSpan.FromMinutes(10675199.0)}" != "7413.07:59:00" ) {
       return 1
   }

   if ("${TimeSpan.FromMinutes(23.34)}" != "00:23:20.400") {
       return 1
   }

   //if (TimeSpan.FromMinutes(-10675199.0).toString() != "-7413.7:59:00") {
   //    return 1
   //}

   if (TimeSpan.FromSeconds(10675199.0).toString() != "123.13:19:59") {
       return 1
   }

   if (TimeSpan.FromSeconds(23.34).toString() != "00:00:23.340") {
       return 1
   }

   //if (TimeSpan.FromSeconds(-10675199.0).toString() != "-123.13:19:59") {
   //    return 1
   //}

   if (TimeSpan.FromMilliseconds(10675199.0).toString() != "02:57:55.199") {
       return 1
   }

   if (TimeSpan.FromMilliseconds(23.34).toString() != "00:00:00.023") {
       return 1
   }

   //if (TimeSpan.FromMilliseconds(-10675199.0).toString() != "-02:57:55.199") {
   //    return 1
   //}

   if (TimeSpan.FromTicks(10675199).toString() != "00:00:01.067") {
       return 1
   }

   if (TimeSpan.FromTicks(2334).toString() != "00:00:00") {
       return 1
   }

   //if (TimeSpan.FromTicks(-10675199).toString() != "-00:00:01.067") {
   //    return 1
   //}



   return 0

}

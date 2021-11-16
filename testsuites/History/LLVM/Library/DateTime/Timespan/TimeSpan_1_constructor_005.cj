// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{
   let ts_day_0 = TimeSpan(-10675199,0,0,0)
   let ts_day_1 = TimeSpan(10675199,0,0,0)

   var ts_hour_0 = TimeSpan(0,-256204778,0,0)
   let ts_hour_1 = TimeSpan(0,256204778,0,0)

   var ts_min_0 = TimeSpan(0,0,-15372286728,0)
   var ts_min_1 = TimeSpan(0,0,15372286728,0)

   var ts_sec_0 = TimeSpan(0,0,0,-922337203685)
   var ts_sec_1 = TimeSpan(0,0,0,922337203685)

   var ts_milsec_0 = TimeSpan(0,0,0,0,-922337203685477)
   var ts_milsec_1 = TimeSpan(0,0,0,0,922337203685477)


   if (ts_day_0.toString() != "-10675199.00:00:00") {
       return 1
   }

   if ("${ts_day_1}" != "10675199.00:00:00") {
       return 1
   }

   if (ts_hour_0.toString() != "-10675199.02:00:00") {
       return 1
   }

   if ("${ts_hour_1}" != "10675199.02:00:00") {
       return 1
   }


   if (ts_min_0.toString() != "-10675199.02:48:00") {
       return 1
   }

   if (ts_min_1.toString() != "10675199.02:48:00") {
       return 1
   }

   if (ts_sec_0.toString() != "-10675199.02:48:05") {
       return 1
   }

   if (ts_sec_1.toString() != "10675199.02:48:05") {
       return 1
   }

   if (ts_milsec_0.toString() != "-10675199.02:48:05.477") {
       return 1
   }

   if (ts_milsec_1.toString() != "10675199.02:48:05.477") {
       return 1
   }


   return 0

}

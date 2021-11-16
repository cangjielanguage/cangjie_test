// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   let ts11: TimeSpan = TimeSpan(10,24,10)
   let ts12: TimeSpan = TimeSpan(-10,24,10)
   let ts13: TimeSpan = TimeSpan(10,24,11)


   var ts21: TimeSpan = TimeSpan(00,10,24,10)
   var ts22: TimeSpan = TimeSpan(00,11,44,50)
   var ts23: TimeSpan = TimeSpan(-00,11,44,50)


   var ts31: TimeSpan = TimeSpan(00,10,24,10,000)
   var ts32: TimeSpan = TimeSpan(10,13,53,30,123)
   var ts33: TimeSpan = TimeSpan(-10,13,53,30,123)


   let ts41: TimeSpan = TimeSpan(600000000)
   let ts42: TimeSpan = TimeSpan(-600000000)
   let ts43: TimeSpan = TimeSpan(374500000000)


   // Constructor TimeSpan(hours: Int64, minutes: Int64, seconds: int3)
   if (TimeSpan.Compare(ts11,ts11).toString() != "0") {
       return 1
   }

   if (TimeSpan.Compare(ts11,ts12).toString() != "1") {
       return 1
   }

   if (TimeSpan.Compare(ts11,ts13).toString() != "-1") {
       return 1
   }

   if (TimeSpan.Compare(TimeSpan(0,0,0),-TimeSpan(0,0,0)).toString() != "0") {
       return 1
   }


   // Constructor TimeSpan(days: Int64, hours: Int64, minutes: Int64, seconds: Int64)
   if (TimeSpan.Compare(ts21,ts22).toString() != "-1") {
       return 1
   }

   if (TimeSpan.Compare(ts21,ts23).toString() != "-1") {
       return 1
   }

   if (TimeSpan.Compare(ts23,TimeSpan(-00,11,44,50)).toString() != "0") {
       return 1
   }

   if (TimeSpan.Compare(TimeSpan(0,0,0,0),-TimeSpan(0,0,0,0)).toString() != "0") {
       return 1
   }

   // Constructor TimeSpan(days: Int64, hours: Int64, minutes: Int64, seconds: Int64, milliseconds:Int64)
   if (TimeSpan.Compare(ts31,ts32).toString() != "-1") {
       return 1
   }

   if (TimeSpan.Compare(ts31,ts33).toString() != "1") {
       return 1
   }

   if (TimeSpan.Compare(ts32,TimeSpan(10,13,53,30,123)).toString() != "0") {
       return 1
   }


   // Constructor TimeSpan(ticks: Int64)

   if (TimeSpan.Compare(ts41,ts43).toString() != "-1") {
       return 1
   }

   if (TimeSpan.Compare(ts41,ts42).toString() != "1") {
       return 1
   }

   if (TimeSpan.Compare(ts43,TimeSpan(374500000000)).toString() != "0") {
       return 1
   }

   if (TimeSpan.Compare(TimeSpan(0),-TimeSpan(0)).toString() != "0") {
       return 1
   }


   return 0

}

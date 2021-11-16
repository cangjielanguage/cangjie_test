// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   let ts1: TimeSpan = TimeSpan(21,19,50)
   var ts2: TimeSpan = TimeSpan(30,06,15,50)
   var ts3: TimeSpan = TimeSpan(10,13,53,30,123)
   let ts4: TimeSpan = TimeSpan(600000000)
   


   if ((ts1-TimeSpan(17,43,58)).toString() != "03:35:52") {
       return 1
   }

   if ((ts2 - ts2).toString() != "00:00:00") {
       return 1
   }

   if ("${ts3 - TimeSpan(17,43,58)}" != "09.20:09:32.123") {
       return 1
   }

   if ("${ts4 - TimeSpan(300000000)}" != "00:00:30") {
       return 1
   }

   if ((ts2-(TimeSpan(21,19,50)-(TimeSpan(10,13,53,30,123)-TimeSpan(600000000)))).toString() != "39.22:48:30.123") {
       return 1
   }


   if ((ts2-TimeSpan(21,19,50)-TimeSpan(10,13,53,30,123)-TimeSpan(600000000)).toString() != "18.19:01:29.877") {
       return 1
   }

   if (ts1.toString() != "21:19:50") {
       return 1
   }

   if (ts2.toString() != "30.06:15:50") {
       return 1
   }

   if (ts3.toString() != "10.13:53:30.123") {
       return 1
   }

   if (ts4.toString() != "00:01:00") {
       return 1
   }

   if ((TimeSpan(0,0,0,0) - ts2).toString() != "-30.06:15:50")
	{
		return 1
	}
   
   return 0

}

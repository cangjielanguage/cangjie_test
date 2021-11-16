// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{


   print(TimeSpan.Parse("5").toString() + "\n")
   print(TimeSpan.Parse("5:20").toString() + "\n")
   print(TimeSpan.Parse("5.11:12").toString() + "\n")
   print(TimeSpan.Parse("8:57:18").toString() + "\n")
   print(TimeSpan.Parse("8:57:18.567").toString() + "\n")
   print(TimeSpan.Parse("1.8:57:18.567").toString() + "\n\n")

   //print(TimeSpan.Parse("-5").toString() + "\n")
   //print(TimeSpan.Parse("-5:20").toString() + "\n")
   //print(TimeSpan.Parse("-5.11:12").toString() + "\n")
   //print(TimeSpan.Parse("-8:57:18").toString() + "\n")
   //print(TimeSpan.Parse("-8:57:18.567").toString() + "\n")
   //print(TimeSpan.Parse("-1.8:57:18.567").toString() + "\n")


   //parse positive number
   if (TimeSpan.Parse("5").toString() != "05.00:00:00") {
       return 1
   }

   if (TimeSpan.Parse("5:20").toString() != "05:20:00") {
       return 1
   }

   if (TimeSpan.Parse("5.11:12").toString() != "05.11:12:00") {
       return 1
   }

   if (TimeSpan.Parse("8:57:18").toString() != "08:57:18") {
        return 1
   }

   if (TimeSpan.Parse("8:57:18.567").toString() != "08:57:18.567") {
       return 1
   }

   if (TimeSpan.Parse("1.8:57:18.567").toString() != "01.08:57:18.567") {
       return 1
   }


   // Parse negative number
   //if (TimeSpan.Parse("-5").toString() != "-5.00:00:00") {
   //    return 1
   //}

   //if (TimeSpan.Parse("-5:20").toString() != "-5:-20:00") {
   //    return 1
   //}

   //if (TimeSpan.Parse("-5.11:12").toString() != "-5.-11:-12:00") {
   //    return 1
   //}

   //if (TimeSpan.Parse("-8:57:18").toString() != "-8:-57:-18") {
   //     return 1
   //}

   //if (TimeSpan.Parse("-8:57:18.567").toString() != "-8:-57:-18.-567") {
   //    return 1
   //}

   //if (TimeSpan.Parse("-1.8:57:18.567").toString() != "-1.-8:-57:-18.-567") {
   //    return 1
   //}

   return 0

}

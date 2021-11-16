// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{
   let ts0 = TimeSpan(22,50,0o36)
   var ts1 = TimeSpan(0x16,0o62,30)
   var ts2 = TimeSpan(0o26,0x32,0b11110)
   var ts3 = TimeSpan(0b10110,0b110010,0x1E)

   if (ts0.toString() != "22:50:30") {
       return 1
   }

   if ("${ts1}" != "22:50:30" ) {
       return 1
   }

   if (ts2.toString() != "22:50:30") {
       return 1
   }

   if ("${ts3}" != "22:50:30" ) {
       return 1
   }


   return 0

}

// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

   let ts1: TimeSpan = TimeSpan(10,24,10)

   var ts2: TimeSpan = TimeSpan(00,10,24,10)

   var ts3: TimeSpan = TimeSpan(00,10,24,10,000)

   let ts4: TimeSpan = TimeSpan(374500000000)

   if (ts1 != -(-TimeSpan(10,24,10))) {
       return 1
   }

   if (ts2 != -(-TimeSpan(00,10,24,10,000))) {
       return 1
   }

   if (-ts3 != -TimeSpan(00,10,24,10,000)) {
       return 1
   }


   return 0

}

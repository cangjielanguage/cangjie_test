// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{
  var d1: DateTime = DateTime(2000,EMonth.Feb,20,23,59,58,2001)

  var d2: DateTime = DateTime(2000,EMonth.Feb,20,8,1, 3, 7)
  var d3: DateTime = DateTime(2000,EMonth.Feb,20,8,9,555)
  
    if (d1.Millisecond().toString() == "1"
       && d2.Millisecond().toString() == "7" && d3.Millisecond().toString() == "0")
        {
            return 0
        }
        
    else{
            return 1
    }

}

    


// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{
  var d1: DateTime = DateTime(2000,EMonth.Feb,20,23,62,58)
  var d2: DateTime = DateTime(2000,EMonth.Feb,20,23,59,61,2001)
  
  var d3: DateTime = DateTime(2000,EMonth.Feb,20,8,01,9)
  var d4: DateTime = DateTime(2000,EMonth.Feb,20,6,2,3,555)

  
    if (d1.Minute().toString() == "2" && d2.Minute().toString() == "0"
       && d3.Minute().toString() == "1" && d4.Minute().toString() == "2")
        {
            return 0
        }
        
    else{
            return 1
    }

}

    


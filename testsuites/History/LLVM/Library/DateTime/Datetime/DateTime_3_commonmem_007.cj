// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{
  var d1: DateTime = DateTime(2000,EMonth.Feb,20,23,62,62)
  var d2: DateTime = DateTime(2000,EMonth.Feb,20,23,59,61,2001)
  
  var d3: DateTime = DateTime(2000,EMonth.Feb,20,22,0,7)
  var d4: DateTime = DateTime(2000,EMonth.Feb,20,1,2,3,88)

  
    if (d1.Second().toString() == "2" && d2.Second().toString() == "3"
        && d3.Second().toString() == "7" && d4.Second().toString() == "3")
        {
            return 0
        }
        
    else{
            return 1
    }

}

    



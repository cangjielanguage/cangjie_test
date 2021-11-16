// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{
  //var d1: DateTime = DateTime(2004,13,20)

  //var d3: DateTime = DateTime(2000,13,20,12,20,00)
    var d2: DateTime = DateTime(2000,EMonth.Dec,20)
    var d4: DateTime = DateTime(2100,EMonth.Dec,31,23,59,59,999)

    if (d2.IsLeapYear() == true && d4.IsLeapYear() == false)
        {
            return 0
        }
        
    else{
            return 1
    }

}


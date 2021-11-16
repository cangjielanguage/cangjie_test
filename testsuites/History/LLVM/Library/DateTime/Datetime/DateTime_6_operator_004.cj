// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

var t1:DateTime = DateTime(1996, EMonth.Dec, 6)
var t11:DateTime = DateTime(1996, EMonth.Oct, 12, 8, 42, 0)
var d1:TimeSpan  = t1 - t11
                                        
var t2:DateTime = DateTime(1996, EMonth.Dec, 6, 13, 2, 0)
var t22:DateTime = DateTime(1996, EMonth.Oct, 12)
var d2:TimeSpan  = t2 - t22

var t3:DateTime = DateTime(1996, EMonth.Dec, 6, 13, 2, 0, 888)
var t33:DateTime = DateTime(1996, EMonth.Oct, 12, 8, 42, 0)
var d3:TimeSpan  = t3 - t33

var t4:DateTime = DateTime(1996, EMonth.Dec, 6)
var t44:DateTime = DateTime(1996, EMonth.Oct, 12, 8, 42, 0)
var d4:TimeSpan  = t44 - t4                      

var t5:DateTime = DateTime(1996, EMonth.Dec, 6, 13, 2, 0)
var t55:DateTime = DateTime(1996, EMonth.Oct, 12)
var d5:TimeSpan  = t55 - t5

var t6:DateTime = DateTime(1996, EMonth.Dec, 6, 13, 2, 0, 888)
var t66:DateTime = DateTime(1996, EMonth.Oct, 12, 8, 42, 0)
var d6:TimeSpan  = t66 - t6


if (d1.toString() == "54.15:18:00"  && d2.toString() == "55.13:02:00"  && d3.toString() == "55.04:20:00.888"
 && d4.toString() == "-54.15:18:00"  && d5.toString() == "-55.13:02:00"  && d6.toString() == "-55.04:20:00.888")
{
    return 0
}
else
{
    return 1
}

}
    
    
    
    
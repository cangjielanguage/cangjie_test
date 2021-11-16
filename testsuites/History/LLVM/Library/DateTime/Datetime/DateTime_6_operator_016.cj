// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{

var t1:DateTime = DateTime(1996, EMonth.Dec, 6)
var t11:DateTime = DateTime(1996, EMonth.Dec, 6)
var d1:Bool = (t1 < t11)

var t2:DateTime = DateTime(1996, EMonth.Oct, 12, 8, 42, 0)
var t22:DateTime = DateTime(1996, EMonth.Oct, 12, 8, 42, 0)
var d2:Bool = (t2 < t22)

var t3:DateTime = DateTime(1996, EMonth.Sep, 12, 8, 30, 0, 777)
var t33:DateTime = DateTime(1996, EMonth.Sep, 12, 8, 30, 0, 777)
var d3:Bool = (t3 < t33)

if (d1.toString() == "false"  && d2.toString() == "false"  && d3.toString() == "false")

{
    return 0
}
else
{
    return 1
}

}
    
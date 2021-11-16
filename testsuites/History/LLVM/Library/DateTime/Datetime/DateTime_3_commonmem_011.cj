// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args


import datetime.*

func main(): Int64{

var s1 = "2020-08-20 00:00:00"
var s2 = "2020-08-20 23:33:44"
var s3 = "2020-08-20 01:06:03:997"
var s4 = "2100-12-31 23:59:59"

if (DateTime.Parse(s1).toString() == "Thu Aug 20 00:00:00 2020" && DateTime.Parse(s2).toString() == "Thu Aug 20 23:33:44 2020"
&& DateTime.Parse(s3).toString() == "Thu Aug 20 01:06:03 2020"   &&  DateTime.Parse(s4).toString() == "Fri Dec 31 23:59:59 2100")
    {
        return 0
    }else{
        return 1
    }
}


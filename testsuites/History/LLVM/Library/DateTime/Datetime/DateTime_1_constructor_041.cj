// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func numMonth(m : EMonth) : Int64 {
match (m) {
        case $Jan => 1
        case $Feb => 2
        case $Mar => 3
        case $Apr => 4
        case $May => 5
        case $Jun => 6
        case $Jul => 7
        case $Aug => 8
        case $Sep => 9
        case $Oct => 10
        case $Nov => 11
        case $Dec => 12
        }
        }

func main(): Int64{


    var t1 = DateTime(2020,EMonth.Aug,20,0,60,0)

    
    if (t1.Year().toString() == "2020" && numMonth(t1.Month()).toString() == "8" && "${t1.Day()}" == "20" && "${t1.Hour()}" == "1" &&"${t1.Minute()}" == "0" && "${t1.Second()}" == "0")

    
    {
        return 0
    }else{
        return 1
    }
}
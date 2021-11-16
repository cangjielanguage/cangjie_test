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

var t1 = DateTime(2020,EMonth.Aug,20)
var d1 = t1 + TimeSpan(0, 90, 0)

var t2 = DateTime(2020,EMonth.Aug,20,1,1,1)
var d2 = t2 + TimeSpan(1,1,1,1)

var t3 = DateTime(2020,EMonth.Aug,20,1,1,1)
var d3 = t3 + TimeSpan(1,1,1,1,1001)
    
    if (d1.Year().toString() != "2020" || numMonth(d1.Month()).toString() != "8" || "${d1.Day()}" != "20" || "${d1.Hour()}" != "1" || "${d1.Minute()}" != "30" || "${d1.Second()}" != "0")
    {
        return 1
    }
    if (d2.Year().toString() != "2020" || numMonth(d2.Month()).toString() != "8" || "${d2.Day()}" != "21"  || "${d2.Hour()}" != "2" ||"${d2.Minute()}" != "2" || "${d2.Second()}" != "2")
    {
        return 1
    }
    if (d3.Year().toString()!= "2020" || numMonth(d3.Month()).toString() != "8" || "${d3.Day()}" != "21" || "${d3.Hour()}" != "2" ||"${d3.Minute()}" != "2" || "${d3.Second()}" != "3")
    {
        return 1
    }
    if (d3.Millisecond().toString() != "1")
    {
        return 1
    }
    
    return 0
    
}
    

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
    var t1 = DateTime(2020,EMonth.Aug,20,0,0,0)
    var t2 = DateTime(2020,EMonth.Aug,20,23,0,0) 
    let t3 = DateTime(2020,EMonth.Aug,20,0,59,0)
    var t4 = DateTime(2020,EMonth.Aug,20,0,0,59)
    let t5 = DateTime(2020,EMonth.Sep,01,00,00,01)
    
    if (t1.Year().toString() != "2020" || numMonth(t1.Month()).toString() != "8" || "${t1.Day()}" != "20" || "${t1.Hour()}" != "0" || "${t1.Minute()}" != "0" || "${t1.Second()}" != "0")
    {        
        return 1
    }
    if (t2.Year().toString() != "2020" || numMonth(t2.Month()).toString() != "8" || "${t2.Day()}" != "20"  || "${t2.Hour()}" != "23" || "${t2.Minute()}" != "0" || "${t2.Second()}" != "0")
    {
        return 1
    }
    if (t3.Year().toString() != "2020" || numMonth(t3.Month()).toString() != "8" || "${t3.Day()}" != "20" || "${t3.Hour()}" != "0" || "${t3.Minute()}" != "59" || "${t3.Second()}" != "0")
    {
        return 1
    }
    if (t4.Year().toString() != "2020" || numMonth(t4.Month()).toString() != "8" || "${t4.Day()}" != "20" || "${t4.Hour()}" != "0" || "${t4.Minute()}" != "0" || "${t4.Second()}" != "59")
    {
        return 1
    }
    if (t5.Year().toString() != "2020" || numMonth(t5.Month()).toString() != "9" || "${t5.Day()}" != "1" || "${t5.Hour()}" != "0" || "${t5.Minute()}" != "0" || "${t5.Second()}" != "1")
    {
        return 1
    }
    
    return 0    
}

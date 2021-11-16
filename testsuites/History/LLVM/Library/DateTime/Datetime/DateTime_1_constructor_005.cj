// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: export TZ='Etc/Greenwich'; %run %run_opt %output %run_args; unset TZ


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

    let t1 = DateTime(-0x4E20,EMonth.Jan,0x1)
    let t2 = DateTime(0x4E20,EMonth.Dec,0x1F)


    var t3 = DateTime(0x0,EMonth.Jan,0x1)
    var t4 = DateTime(0x1,EMonth.Dec,0x1)
    var t5 = DateTime(0x1,EMonth.Jan,0x1F)
    var t6 = DateTime (0x7E5,EMonth.Feb,0x1C)
    var t7 = DateTime(0x7D0,EMonth.Feb,0x1D)
    var t8 = DateTime(0x834,EMonth.Feb,0x1C)
    var t9 = DateTime(0x7E4,EMonth.Jan,0x1)

    if (t1.Year().toString() != "-20000" || numMonth(t1.Month()).toString() != "1" || "${t1.Day()}" != "1")
    {
        return 1
    }
    if (t2.Year().toString() != "20000" || numMonth(t2.Month()).toString() != "12" || "${t2.Day()}" != "31")
    {
        return 1
    }
    
    if (t3.Year().toString() != "0" || numMonth(t3.Month()).toString() != "1" || "${t3.Day()}" != "1")
    {
        return 1
    }
    if (t4.Year().toString() != "1" || numMonth(t4.Month()).toString() != "12" || "${t4.Day()}" != "1")
    {
        return 1
    }
    if ("${t5.Year()}" != "1" || "${numMonth(t5.Month())}" != "1" || "${t5.Day()}" != "31")
    {
        return 1
    }
    if (t6.Year().toString() != "2021" || numMonth(t6.Month()).toString() != "2" || "${t6.Day()}" != "28")
    {
        return 1
    }
    if (t7.Year().toString() != "2000" ||numMonth(t7.Month()).toString() != "2" || "${t7.Day()}" != "29")
    {
        return 1
    }
    if (t8.Year().toString() != "2100" || numMonth(t8.Month()).toString() != "2" || "${t8.Day()}" != "28")
    {
        return 1
    }
    if ("${t9.Year()}" != "2020" || "${numMonth(t9.Month())}" != "1" || "${t9.Day()}" != "1")
    {
        return 1
    }
    
    return 0
}


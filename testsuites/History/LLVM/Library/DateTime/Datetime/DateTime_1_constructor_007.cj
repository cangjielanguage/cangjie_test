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
    var t1 = DateTime(-20000,EMonth.Jan,1, 0,0,0) //取时间范围最左边的值
    var t2 = DateTime(20000,EMonth.Dec,31)
    
    if (!(t1.Year().toString() == "-20000" && numMonth(t1.Month()).toString() == "1" && "${t1.Day()}" == "1"))
    {
        return 1
    }
    if (!(t2.Year().toString() == "20000" && numMonth(t2.Month()).toString() == "12" && "${t2.Day()}" == "31"))
    {
        return 1
    }
    
    else
    {
        return 0
    }
}

//格林威治时区,时间范围为[-20000.01.01.00:00:00, 20000.12.31.23:59:59]
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

if (DateTime.MaxValue().Year().toString() != "20000")
{
    return 1
}

if (numMonth(DateTime.MaxValue().Month()).toString() != "12"  || DateTime.MaxValue().Day().toString() != "31")
{
    return 1
}

if (DateTime.MaxValue().Hour().toString() != "23"  || DateTime.MaxValue().Minute().toString() != "59")
{
    return 1
}

if (DateTime.MaxValue().Second().toString() != "59")
{
    return 1
}

return 0

}

//格林威治时区,时间范围为[-20000.01.01.00:00:00, 20000.12.31.23:59:59]



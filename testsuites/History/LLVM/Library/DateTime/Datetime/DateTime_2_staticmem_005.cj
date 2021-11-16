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

if (DateTime.Now().Year() < -20000 || DateTime.Now().Year() > 20000)
{
    return 1
}
if (numMonth(DateTime.Now().Month()) < 1 || numMonth(DateTime.Now().Month()) > 12)
{
    return 1
}
if (DateTime.Now().Day() < 1 || DateTime.Now().Day() > 31)
{
    return 1
}
if (DateTime.Now().Hour() < 0 || DateTime.Now().Hour() > 23)
{
    return 1
}
if (DateTime.Now().Minute() < 0 || DateTime.Now().Minute() > 59)
{
    return 1
}
if (DateTime.Now().Second() < 0 || DateTime.Now().Second() > 59)
{
    return 1
}

return 0
}

   //注意：分和秒 时刻在变化
   //测试打印发现获取年和月的值错误
   //打印形式：DateTime.Now().toString() != "Thu Aug 27 20:53:42 2020" 



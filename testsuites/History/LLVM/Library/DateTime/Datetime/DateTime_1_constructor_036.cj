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

    
    var t1 = DateTime(2020,EMonth.Sep,1,0b1100,0b0,0b0,0)        //二进制
    let t2 = DateTime(2020,EMonth.Sep,1,0o14,0o0,0o0,999)        //八进制
    let t3 = DateTime(2020,EMonth.Sep,01,0xc,0x0,0x0,00)        //十六进制
    var t4 = DateTime(2020,EMonth.Sep,001,0b1100,0o0,0x0,999)  //混合

    if (t1.Year().toString()!="2020"||numMonth(t1.Month()).toString()!="9"||"${t1.Day()}"!="1"||"${t1.Hour()}"!="12"||"${t1.Minute()}"!="0"||"${t1.Second()}"!="0"||"${t1.Millisecond()}"!="0")
    {
        return 1
    }
    if (t2.Year().toString()!="2020"||numMonth(t2.Month()).toString()!= "9"||"${t2.Day()}"!="1"||"${t2.Hour()}"!="12"||"${t2.Minute()}"!="0"||"${t2.Second()}"!="0"||"${t2.Millisecond()}"!="999")
    {
        return 1
    }
    if (t3.Year().toString()!="2020"||numMonth(t3.Month()).toString()!="9"||"${t3.Day()}"!="1"||"${t3.Hour()}"!="12"||"${t3.Minute()}"!="0"||"${t3.Second()}"!= "0"||"${t3.Millisecond()}"!="0")
    {
        return 1
    }
    if (t4.Year().toString()!="2020"||numMonth(t4.Month()).toString()!="9"||"${t4.Day()}"!="1"||"${t4.Hour()}"!="12"||"${t4.Minute()}"!="0"||"${t4.Second()}"!= "0"||"${t4.Millisecond()}"!="999")
    {
        return 1
    }

    return 0
    
}
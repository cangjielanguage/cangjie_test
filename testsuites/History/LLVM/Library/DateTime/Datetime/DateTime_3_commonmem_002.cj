// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args


import datetime.*

func weekNum(w: EWeekday): Int64{
    return match (w) {
        case $Sun => 0
        case $Mon => 1
        case $Tue => 2
        case $Web => 3
        case $Thu => 4
        case $Fri => 5
        case $Sat => 6
    
    }
}

func main(): Int64{
    var t1: DateTime = DateTime(2020,EMonth.Aug,24)
    var t2: DateTime = DateTime(2020,EMonth.Aug,25)
    var t3: DateTime = DateTime(2020,EMonth.Aug,26)
    let t4: DateTime = DateTime(2020,EMonth.Aug,27)
    let t5: DateTime = DateTime(2020,EMonth.Aug,28)
    var t6: DateTime = DateTime(2020,EMonth.Aug,29)
    var t7: DateTime = DateTime(2020,EMonth.Aug,30)  
    
    var t8: DateTime = DateTime(2000,EMonth.Feb,32)

    //weekNum(t1.DayOfWeek()).toString()
    
    //print(weekNum(t1.DayOfWeek()).toString())        
            
    if (weekNum(t1.DayOfWeek()).toString() == "1" && weekNum(t2.DayOfWeek()).toString() == "2" && weekNum(t3.DayOfWeek()).toString() == "3"
     && weekNum(t4.DayOfWeek()).toString() == "4" && weekNum(t5.DayOfWeek()).toString() == "5" && weekNum(t6.DayOfWeek()).toString() == "6"
       && weekNum(t7.DayOfWeek()).toString() == "0" && weekNum(t8.DayOfWeek()).toString() == "5")
    {
            return 0
        }
        
    else{
            return 1
    }
    
    return 0
    
}


    
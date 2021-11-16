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
            
    var t1: DateTime = DateTime(2000,EMonth.Jan,22)
    var t2: DateTime = DateTime(2000,EMonth.Jan,23,4,5,6)
    var t3: DateTime = DateTime(2000,EMonth.Jan,23,4,5,6,999)

    let t4: DateTime = DateTime(2000,EMonth.Feb,32)    
    
    if (weekNum(t1.DayOfWeek()).toString() == "6" && weekNum(t2.DayOfWeek()).toString() == "0" && weekNum(t3.DayOfWeek()).toString() == "0"
       && weekNum(t4.DayOfWeek()).toString() == "5")
    {
            return 0
        }
        
    else{
            return 1
    }

}


    
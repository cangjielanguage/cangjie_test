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
    var dt1: DateTime = DateTime(2000,EMonth.Jan,32)

    
    let dt4: DateTime = DateTime(2000,EMonth.Jan,12,21,6,7)
    let dt5: DateTime = DateTime(2000,EMonth.Jan,13,21,6,7,999)
    var dt6: DateTime = DateTime(2001,EMonth.Nov,9)
    
    
    if (dt1.Day().toString() == "1"
       && dt4.Day().toString() == "12" && dt5.Day().toString() == "13" && dt6.Day().toString() == "9")
    {
            return 0
        }
        
    else{
            return 1
    }
    
}



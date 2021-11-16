// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args


import datetime.*




func main(): Int64{
  var d1: DateTime = DateTime(2000,EMonth.Feb,20,25,59,59,999)
  var d2: DateTime = DateTime(2000,EMonth.Feb,20,23,61,59,999)
  let d3: DateTime = DateTime(2000,EMonth.Feb,20,23,58,121,999)
  var d4: DateTime = DateTime(2000,EMonth.Feb,20,23,59,58,2001)
  
  let d5: DateTime = DateTime(2000,EMonth.Feb,20,8,1,0)
  var d6: DateTime = DateTime(2000,EMonth.Feb,20,7,6,1,33)
  
  
    if (d1.Hour().toString() == "1" && d2.Hour().toString() == "0" && d3.Hour().toString() == "0" && d4.Hour().toString() == "0"
       && d5.Hour().toString() == "8" && d6.Hour().toString() == "7")
    
        {
            return 0
        }
        
    else{
            return 1
    }

}



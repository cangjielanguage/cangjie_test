// EXEC: echo "datetime=%libdir/datetime/datetime.cjo" > datetime.cfg
// EXEC: %compiler -i datetime.cfg %libdir/datetime/cangjieDatetime.o %f -o %output
// EXEC: %run %run_opt %output %run_args

import datetime.*

func main(): Int64{
  //var d1: DateTime = DateTime(2000,13,20)
  var d2: DateTime = DateTime(2000,EMonth.Dec,32,23,62,62)
  
  var d3: DateTime = DateTime(2017,EMonth.Dec,8)
 // var d4: DateTime = DateTime(2018,13,20,3,4,5)
 // var d5: DateTime = DateTime(2019,13,20,3,4,5,777)

 
    if ( (d2.Year().toString() == "2001")
      && d3.Year().toString() == "2017")
        {
            return 0
        }
        
    else{
            return 1
    }

}
// 获取年数据打印全部不准确，应该是bug，已提相关单子
//获取结果为：101 101 117 119 120

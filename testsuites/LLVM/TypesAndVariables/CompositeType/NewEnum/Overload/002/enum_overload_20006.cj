// DEPENDENCE: define_20006.cj
// EXEC: %compiler %cmp_opt -c define_20006.cj -o define.%middle
// EXEC: echo "define=./define.cjo" > define.cfg
// EXEC: %compiler %cmp_opt define.%middle %f -i define.cfg -o %output
// EXEC: %run %run_opt %output %run_args

import define.*

enum E<T>{
|e(T,T)
|e(T,T,T)
|e(T,T,T,T)
}


func  e<T>(i1:T,i2:T,i3:T,i4:T,i5:T){}

func main(): Int64 {
    e(1)
    e(1,1,1)
    e(1,1,1,1)
    e(1,1,1,1,1)
    return 0
}

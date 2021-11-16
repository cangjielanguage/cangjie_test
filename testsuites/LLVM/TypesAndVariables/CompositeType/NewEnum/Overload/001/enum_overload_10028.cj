// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


enum E<T>{
|e(T,T)
|e(T,T,T)
|e(T,T,T,T)
}

func e<T>(i:T){}
func e<T>(i1:T,i2:T,i3:T,i4:T,i5:T){}

func main(): Int64 {
    e(1)
    e(1,1)
    e(1,1,1)
    e(1,1,1,1)
    e(1,1,1,1,1)
    return 0
}

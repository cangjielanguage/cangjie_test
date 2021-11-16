// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


enum E<T>{
|e(T,T)
|e(T,T,T)
|e(T,T,T,T)
}

enum F{
|e(Int64)
|e(Int64,Int64)
}

func main(): Int64 {
    e(1)
    e(1,1,1)
    e(1,1,1,1)
    return 0
}

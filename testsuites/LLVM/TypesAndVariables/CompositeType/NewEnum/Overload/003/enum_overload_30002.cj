// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T>{
    e(T)|e(T,T)
    func x(i:T){e(i);e(i,i)}
}

enum F<T>{
    e(T)|e(T,T)
    func x(i:T){e(i);e(i,i)}
}

func main(): Int64 {
    E.e(1).x(1)
    return 0
}

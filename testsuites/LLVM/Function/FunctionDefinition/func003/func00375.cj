// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func Add<T>(a:T, b:T) : T {
       return a
}
func main(): Int64 {
    return Add<Int64>(0,0)
}

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func Some<T>(a:T){}

func main(): Int64 {
    var a = Option.Some(0)
    return a??1
}

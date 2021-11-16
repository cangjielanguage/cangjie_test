// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit1<T> {
    Year(T)
}

func run():Int64{
    var t0:TimeUnit1<Int32> = TimeUnit1<Int32>.Year(20)
    return 0
}
func main(): Int64 {
    return run()
}


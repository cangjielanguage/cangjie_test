// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit<T> {
      Year(T) | Month(T, T)
      | TwoUnit(TimeUnit<T>, TimeUnit<T>)
}

func run(): Int64 {
    var time = TimeUnit<Int32>.TwoUnit(TimeUnit<Int32>.Year(2020), TimeUnit<Int32>.Month(9,19))
    var res: Int32 = match (time) {
        case Year(x) => x
        case Month(x,y) => x+y
        case TwoUnit(Year(x), Month(y,z)) => x+y+z
        case _ => 0
    }

    if (res == 2048) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

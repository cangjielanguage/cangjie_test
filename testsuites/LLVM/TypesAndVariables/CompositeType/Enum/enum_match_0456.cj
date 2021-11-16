// EXEC: %compiler %cmp_opt  %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit1 {
      Hour
      | Day(Int32)
}
enum TimeUnit2 {
       Month(TimeUnit1)
}

func run(): Int64 {
    var time = TimeUnit2.Month(TimeUnit1.Day(5))
    var res: Int32 = match (time) {
        case Month($Hour) => 0
        case Month(Day(x)) => x
    }
    if (res == 5) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}

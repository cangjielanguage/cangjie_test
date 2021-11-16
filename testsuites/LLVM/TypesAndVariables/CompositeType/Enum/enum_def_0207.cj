// EXEC: %compiler %cmp_opt  %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit1 {
      Hour(TimeUnit2)
      | Year
}
enum TimeUnit2 {
      Month(TimeUnit1)
}

func run(): Int64 {
    var time = TimeUnit2.Month(TimeUnit1.Year)
    var res: Int32 = match (time) {
        case Month(Year) => 2020
        case _ =>1
    }

    if (res == 2020) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}

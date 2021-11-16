// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Week { Day(String) }

func run(): Int64 {
    var week = Week.Day("Monday")
    var res: Int32 = match (week) {
        case Day(x) => 1
    }
    if (res == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
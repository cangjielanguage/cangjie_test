// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Week { Day(Char) }


func run(): Int64 {
    var week = Week.Day('一')
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
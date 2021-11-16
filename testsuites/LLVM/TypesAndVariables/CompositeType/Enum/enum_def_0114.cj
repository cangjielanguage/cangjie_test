// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
      Year(Int32) | Month(Int32)
}

func run(): Int64 {
    var time = TimeUnit.Year(2020)
    var res: Int32 = match (time) {
        case Year(x) => x
        case Month(y) => y-1
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

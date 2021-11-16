// EXEC: %compiler %cmp_opt  %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
      Hour(Int32)
      | Day(Int32,Int32)
      | Month(Int32,Int32)
}

func run(): Int64 {
    var time = TimeUnit.Month(2020,2022)
    var res: Int32 = match (time) {
        case Hour(x) => x-1
        case Day(x,y) => y-x
        case Month(x,y) => x+y
    }

    if (res == 4042) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}

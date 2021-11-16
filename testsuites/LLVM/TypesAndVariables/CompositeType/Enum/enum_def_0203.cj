// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
      Year(Int32) | Month(Int32, Int32)
      | TwoUnit(TimeUnit, TimeUnit)
}

func run(): Int64 {
    var time = TimeUnit.TwoUnit(TimeUnit.Year(2020),TimeUnit.Month(5,8))
    var res: Int32 = match (time) {
        case Year(x) => x
        case Month(x,y) => x+y
        case TwoUnit(Year(x), Month(y,z)) => x+y+z
        case _ => 0
    }

    if (res == 2033) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}

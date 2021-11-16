//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum TimeUnit {
      Year(Int32) | Month(Int32, Int32)
      | TwoUnit(Box<TimeUnit>,Box<TimeUnit>)
}

func run(): Int64 {
    var time = TimeUnit.TwoUnit(Year(2020),Month(5,8)) // EXPECTED: regex-auto return type for 'Year' is mismatched
    var res: Int32 = match (time) {
        case Year(x) => x
        case Month(x,y) => x+y
        case TwoUnit(Year(x), Month(y,z)) => x+y+z
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

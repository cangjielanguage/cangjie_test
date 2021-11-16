// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum TimeUnit {
      Year(Int32, Float32) | Month(Int32, Float32)
}

func run(): Int64 {
    var time = TimeUnit.Year(2020, 20.2)
    var res: Float32 = match (time) {
        case Year(x, y) => y
        case Month(m, n) => n+1.0
    }

    if (res == 20.2) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}

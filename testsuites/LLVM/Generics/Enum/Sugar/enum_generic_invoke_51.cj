// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var pie: Float64*String = (3.14, "PIE")
    var time = Time.Day(pie)
    var res: String = match (time) {
        case Day(x)=> pie[0].toString()+ pie[1]
    }
    if (res == "3.140000PIE" || res == "3.14PIE") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


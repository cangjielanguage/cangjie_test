// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Date { Day(Int32) }

enum Time<T> where T <: Date{
    Day(T)
}

func run(): Int64 {
    var date: Date = Date.Day(14)
    var time: Time<Date> = Time<Date>.Day(date)
    var res: Int32 = match (time) {
        case Day(x) => match (x) { case Day(x) => x+1}
    }
    if (res == 15) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

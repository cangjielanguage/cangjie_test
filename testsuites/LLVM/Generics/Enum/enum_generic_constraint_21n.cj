// EXEC-PIPE-1: %compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected member name or constructor call after 'Date' type name

enum Date { Day(Int32) }

enum Time<T> where T <: Date{
    Day(T)
}

func run(): Int64 {
    var time: Time<Date> = Time<Date>.Day(Date)
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

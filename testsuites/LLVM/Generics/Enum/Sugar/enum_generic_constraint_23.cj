// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum Date<T> { Day(T) }

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    var date: Date<String> = Date<String>.Day("enum")
    var time = Time.Day(date)
    var res: String = match (time) {
        case Day(x) => match (x) { case Day(x) => x+"!"}
    }
    if (res == "enum!") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var ch: Char = '\u{5234}'
    var time = Time<Char>.Day(ch)
    var res = match (time) {
        case Day(x) => x
    }
    if (res == '\u{5234}') {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


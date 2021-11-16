// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

enum Time<T>{
    Day(T)
}

func run(): Int64 {
    var str: String = "hello Char lang"
    var time = Time<String>.Day(str)
    var res = match (time) {
        case Day(x) => x+"!"
    }
    if (res == "hello Char lang!") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


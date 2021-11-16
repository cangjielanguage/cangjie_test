// EXEC: %compiler -backend js %f -o %n.js
// EXEC: %compiler -backend js %f -o %n.js
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var i: Int32 = 3
    var str: String = i.toString()
    if (str == "3") {
        return 0
    }
    return 1
}


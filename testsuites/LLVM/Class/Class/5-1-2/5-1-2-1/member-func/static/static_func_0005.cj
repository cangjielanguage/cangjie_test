// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
    static func f() : Int32 {
        return 1
    }
    static func get() : Int32 {
        return f()
    }
}

func run(): Int64 {
    if (Data.get() != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}

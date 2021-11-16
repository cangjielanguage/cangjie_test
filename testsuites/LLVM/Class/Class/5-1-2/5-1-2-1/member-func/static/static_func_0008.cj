// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class DataA {
    static var a = 10
}

class DataB {
    static func getB() : Int64 {
        return DataA.a
    }
}

func run(): Int64 {
    if (DataB.getB() != 10) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}

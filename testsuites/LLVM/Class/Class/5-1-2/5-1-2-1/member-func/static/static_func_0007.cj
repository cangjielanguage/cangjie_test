// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 

class DataA {
    static func getA() : Int32 {
        return 1
    }
}

class DataB {
    static func getB() : Int32 {
        return DataA.getA()
    }
}

func run(): Int64 {
    if (DataB.getB() != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}

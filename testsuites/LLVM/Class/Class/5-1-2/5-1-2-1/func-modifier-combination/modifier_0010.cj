// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


class Data {
    static var  a : Int32 = 1
    private static func f() : Int32 {
        a = a + 1
        return a
    }
    public  func get() : Int32 {
        return f()
    }
}

func run(): Int64 {
    var value : Data = Data()
    if (value.get() != 2) {
        return 2
    }
    if (value.get() != 3) {
        return 3
    }
    return 0
}

func main(): Int64 {
    return run()
}

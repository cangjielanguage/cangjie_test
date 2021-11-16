// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


abstract class Base {
    func getA() : Int32
    func getB() : Int32 {
        return getA() + 3
    }
}

class Data <: Base {
    public func getA() : Int32 {
        return  1
    }
}

func run(): Int64 {
    var value : Data = Data()
    if (value.getA() != 1) {
        return 1
    }
    if (value.getB() != 4) {
        return 2
    }
    return 0
}

func main(): Int64 {
    return run()
}

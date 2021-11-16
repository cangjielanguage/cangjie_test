// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


abstract class BaseA {
    func getA() : Int32
}

abstract class BaseB <: BaseA {
    func getA() : Int32 {
        return 1
    }
    func getB() : Int32
}

class Data <: BaseB {
    func getB() : Int32 {
        return 2
    }
}

func run(): Int64 {
    var value : Data = Data()
    if (value.getA() != 1) {
        return 1
    }
    if (value.getB() != 2) {
        return 2
    }
    return 0
}

func main(): Int64 {
    return run()
}
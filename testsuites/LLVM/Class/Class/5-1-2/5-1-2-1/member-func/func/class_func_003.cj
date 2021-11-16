// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


abstract class Base {
    private func inc(value : Int32) : Int32 {
        return value + 1
    }

    public func get() : Int32 {
        return inc(1)
    }
}

class Data <: Base {

}

func run(): Int64 {
    var value1 : Data = Data()
    if (value1.get() != 2) {
        return 2
    }
    return 0
}

func main(): Int64 {
    return run()
}

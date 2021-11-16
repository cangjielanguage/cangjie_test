// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


abstract class BaseA {
    open func get() : Int32 {
        return 1
    }
}

abstract class BaseB <: BaseA {
    override func get() : Int32 {
        return 2
    }
}

class Data <: BaseB {

}

func run(): Int64 {
    var value : Data = Data()
    if (value.get() != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
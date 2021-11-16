// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args


open class Base {
    private func f() : Int32 {
        return 1
    }
    public func get() : Int32 {
        return f() + 1
    }
}

class Data <: Base {

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

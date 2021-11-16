// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
    protected  static func f() : Int32 {
        return 1
    }
}

class Data <: Base {
    func get() : Int32 {
        return Base.f()
    }
}

func run(): Int64 {
    var value : Data = Data()
    if (value.get() != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}


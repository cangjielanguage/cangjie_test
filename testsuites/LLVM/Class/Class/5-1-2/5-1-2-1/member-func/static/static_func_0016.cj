// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
    static var a : Int32 = 1
}

class Data <: Base {
    static func get() : Int32 {
        return Base.a
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

// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


open class Base {
    static func f() : Int32 {
        return 1
    }
}

class Data <: Base {
    static func get() : Int32 {
        return Base.f()
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

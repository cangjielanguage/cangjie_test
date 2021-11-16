// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args  


abstract class Base {
    static func get() : Int32 {
        return 1
    }
}

func run(): Int64 {
    if (Base.get() != 1) {
        return 1
    } else {
        return 0
    }
}

func main(): Int64 {
    return run()
}

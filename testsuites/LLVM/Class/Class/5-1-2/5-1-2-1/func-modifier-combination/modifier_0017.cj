// EXEC: %compiler %cmp_opt %n.cj -o %output  2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args 
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    protected  static func f() : Int32 {
        return 1
    }
}

class Data <: Base {
    func get() :Int32 {
        return f()
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


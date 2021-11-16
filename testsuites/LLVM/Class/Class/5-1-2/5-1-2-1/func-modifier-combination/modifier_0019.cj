// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Base {
    protected  static func f() : Int32 {
        return 1
    }
}

class Data <: Base {
    func get() :Int32 {
         return super.f() // EXPECTED: regex object cannot access static member 'f'
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


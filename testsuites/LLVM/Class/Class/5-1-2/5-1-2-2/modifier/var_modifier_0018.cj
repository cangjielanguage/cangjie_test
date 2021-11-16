// EXEC: %compiler %cmp_opt  %f -o %output 2>&1| compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base {
    static var a : Int32 = 1
}

class Data <: Base {
    func get() : Int32 {
        return super.a // EXPECTED: regex object cannot access static member 'a'
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

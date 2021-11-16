// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

abstract class Base {
    open  func get() : Int32 // EXPECTED: regex abstract function 'get' should not have modifiers
}

class Data <: Base {
    open func get() : Int32 {
        return 1
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


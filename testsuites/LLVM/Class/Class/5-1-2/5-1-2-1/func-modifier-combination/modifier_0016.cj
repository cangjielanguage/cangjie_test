// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class BaseA {
    open func get() : Int32 {
        return 1
    }
}

class BaseB <: BaseA {
    override func get() : Int32 // EXPECTED: regex function 'get' can not be abstract
}

class Data <: BaseB {
    func get() : Int32 {
        return 2
    }
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

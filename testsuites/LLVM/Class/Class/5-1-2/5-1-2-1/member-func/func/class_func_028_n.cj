// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex no matching function declaration for function call


open class Base {
    private func get() : Int32 {
        return 1
    }
}

class Data <: Base {
    public func f() : Int32 {
        return get()
    }
}

func run(): Int64 {
    
    var value : Data = Data() 
    if (value.f() != 1) {
        return 1 
    }
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

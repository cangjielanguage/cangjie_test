// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex type of return expression is incompatible with return type


abstract class Base {
    private func inc(value : Int32) : Int32 {
        return value + 1
    }
}

class Data <: Base {
    public func get() : Int32 {
        return inc(1)
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

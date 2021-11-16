// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex overridden function 'get' should have 'open' modifier

abstract class BaseA {
    func get() : Int32 {
        return 1
    }
}

abstract class BaseB <: BaseA {
    override func get() : Int32 {
        return 2
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

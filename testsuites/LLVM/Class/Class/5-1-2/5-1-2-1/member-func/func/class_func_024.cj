// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex override function 'b' does not have an overridden function


abstract class BaseA {
    open func a() : Int32 {
        return 1
    }
}

abstract class BaseB <: BaseA {
    override func b() : Int32 {
        return 2
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

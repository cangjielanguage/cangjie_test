// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex  need 'override' modifier for function 'get'


abstract class BaseA {
    open func get() : Int32 {
        return 1
    }
}

class Data <: BaseA {
    func get() : Int32 {
        return 2
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

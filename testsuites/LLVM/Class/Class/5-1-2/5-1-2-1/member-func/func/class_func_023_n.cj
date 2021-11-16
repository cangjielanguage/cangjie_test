// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

abstract class BaseA {
    func get() : Int32 { // EXPECTED: regex overridden function 'get' should have 'open' modifier
        return 1
    }
}

abstract class BaseB <: BaseA {
    func get() : Int32 { // EXPECTED: regex need 'override' modifier for function 'get'
        return 2
    }
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace



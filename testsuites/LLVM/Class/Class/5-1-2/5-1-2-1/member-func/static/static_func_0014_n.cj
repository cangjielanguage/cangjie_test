// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f

open class Base {
    static var a : Int32 = 1
}

class Data <: Base {
    static func get() : Int32 {
        return super.a // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
    }
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

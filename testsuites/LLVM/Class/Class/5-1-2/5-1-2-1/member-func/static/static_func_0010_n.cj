// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex 'a' is non-static member, cannot be accessed by static function 'getB'

open class Base {
    var a : Int32 = 1
}

class Data <: Base {
    static func getB() : Int32 {
        return a
    }
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

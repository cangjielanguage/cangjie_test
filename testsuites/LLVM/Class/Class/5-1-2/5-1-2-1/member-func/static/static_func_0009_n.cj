// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex 'getA' is non-static member, cannot be accessed by static function 'getB'

open class Base {
    func getA() : Int32 {
        return 1
    }
}

class Data <: Base {
    static func getB() : Int32 {
        return getA()
    }
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

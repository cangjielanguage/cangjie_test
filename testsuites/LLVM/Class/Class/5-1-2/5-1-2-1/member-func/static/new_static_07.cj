// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f

class Base {
    var a: Int32 = 0
    func f() : Int32 { // EXPECTED: regex-not [a-z]
        return a
    }
    static func get() : Int32 {
        return a // EXPECTED: regex 'a' is non-static member, cannot be accessed by static function 'get'

    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

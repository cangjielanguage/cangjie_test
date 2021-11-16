// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f

class Base {
    var a: Int32 = 0
    func f() : Int32 { // EXPECTED: regex-not [a-z]
        return a
    }
    static func get() : Int32 {
        a = 5 // EXPECTED: regex 'a' is non-static member, cannot be accessed by static function 'get'
        return 0
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

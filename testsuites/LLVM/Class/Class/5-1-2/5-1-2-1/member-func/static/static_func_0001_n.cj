// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex 'f' is non-static member, cannot be accessed by static function 'get'


class Base {
    func f() : Int32 {
        return 1
    }
    static func get() : Int32 {
        return f()
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

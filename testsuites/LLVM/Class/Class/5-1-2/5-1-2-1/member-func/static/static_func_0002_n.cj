// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex 'a' is non-static member, cannot be accessed by static function 'get'


class Base {
    let a : Int32 = 1
    static func get() : Int32 {
        return a
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f

class Base {
    func f() : Int32 {
        return 1
    }
    static func get() : Int32 {
        func a(): Int32{
          return f() // EXPECTED: regex 'f' is non-static member, cannot be accessed by static function 'a'
        }
        return a()
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

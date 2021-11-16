// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f

open class Super{
	  func f() : Int32 {
        return 1
    }
}

class Base <: Super{
    static func get() : Int32 {
        var a = f // EXPECTED: regex 'f' is non-static member, cannot be accessed by static function 'get'
        return a()
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

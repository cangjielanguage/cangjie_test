// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex can not access field 'a'


open class Base {
    private var a : Int32 = 1
}

class Data <: Base {
    func get() : Int32 {
        return a
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

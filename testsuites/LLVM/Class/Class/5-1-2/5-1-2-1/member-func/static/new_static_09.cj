// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f

open class Base2{
    var aa: Int32 = 0
}
class Base <: Base2{
    var a: Int32 = 0
    func f() : Int32 { // EXPECTED: regex-not [a-z]
        return a
    }
    static func get() : Int32 {
        super<Base2>.aa //EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
        return 0

    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

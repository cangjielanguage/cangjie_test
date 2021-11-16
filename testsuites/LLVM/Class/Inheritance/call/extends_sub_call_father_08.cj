// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

open class Base {
    static var one : Int32 = 1
}

class Data <: Base {
    static var one : Int32 = 2 // EXPECTED: regex the variable 'one' must not shadow a member variable of the supertype
    var res = Base.one
}

func main(): Int64 {
    var obj = Data()
    if (obj.res != 1) {
        return 1
    }
    return 0
}

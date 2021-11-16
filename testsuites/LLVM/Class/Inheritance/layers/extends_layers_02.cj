// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

open class Base3 {
    var test : Int32 = 1
}

open class Base2 <: Base3 {
    var test : Int32 = 2  // EXPECTED: regex the variable 'test' must not shadow a member variable of the supertype
}

class Data <: Base2 {
    var test : Int32 = 3  // EXPECTED: regex the variable 'test' must not shadow a member variable of the supertype
}

func main(): Int64 {
    var obj = Data()
    var res : Int32 = obj.test
    if (res != 3) {
        return 1
    }
    return 0
}

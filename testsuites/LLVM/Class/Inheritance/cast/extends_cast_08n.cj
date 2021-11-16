// EXEC: %compiler %cmp_opt %f -o %output | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
}

class Data <: Base {
    func foo(): Int32 {
        return 3
    }
}

func main(): Int64 {
    var obj : Data = Data(Base()) EXPECTED: regex initializer's type is incompatible with variable declaration 'obj'
    var res1 : Int32 = obj.foo()
    if (res1 != 3) {
        return 1
    }

    return 0
}

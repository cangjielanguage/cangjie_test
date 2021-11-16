// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base3 {
    func foo3() : Int32 {
        return 3
    }
}

open class Base2 <: Base3 {
    func foo2() : Int32 {
        return 2
    }
}

class Data <: Base2 {
    var one : Int32 = foo3() + foo2()// EXPECTED: regex 'foo3' is not allowed to be accessed before all member variables are initialized
}

func main(): Int64 {
    var obj = Data()
    var res : Int32 = obj.one
    if (res != 5) {
        return 1
    }
    return 0
}
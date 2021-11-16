// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface BaseI {
    static func foo () {
        return 1
    }
}

open class BaseC {
    func foo (a : Int64) {
        return a
    }
}

class Data <: BaseC & BaseI {
    func foo (a : Int64 , b : Int64) { // EXPECTED: regex non-static member 'foo' cannot have the same name with static member in parent class or interfaces
        return a + b
    }
}

func main(): Int64 {
    var obj = BaseC()
    var obj1 = Data()
    
    var res1 : Int64 = BaseI.foo() // EXPECTED: regex function 'foo' cannot be accessed by interface name 'BaseI'
    var res2 : Int64 = obj.foo(2)
    var res3 : Int64 = obj1.foo(1,2)
    
    if (res1 != 1 || res2 != 2 || res3 != 3) {
        return 1
    }
    return 0
}
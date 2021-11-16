// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface Base {
    static func foo () {
        return 1
    }
}

class Data <: Base {
    func foo (a : Int64) { // EXPECTED: regex non-static member 'foo' cannot have the same name with static member in parent class or interfaces
        return a
    }
}

func main(): Int64 {
    var obj = Data()
    
    var res1 : Int64 = Base.foo() // EXPECTED: regex function 'foo' cannot be accessed by interface name 'Base'
    var res2 : Int64 = obj.foo(2)
    if (res1 != 1 || res2 != 2) {
        return 1
    }
    return 0
}
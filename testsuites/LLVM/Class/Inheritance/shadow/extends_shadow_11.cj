// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    func test(): Int32 { return 1 }
}

class Data <: Base {
    var test: Int32 = 2  // EXPECTED: regex non-static member 'test' cannot have the same name with non-static member in parent class or interfaces
}

func main(): Int64 {
    var obj1 = Base()
    var obj2 = Data()

    var res1:Int32 = obj1.test()
    var res2:Int32 = obj2.test
    
    return 0
}

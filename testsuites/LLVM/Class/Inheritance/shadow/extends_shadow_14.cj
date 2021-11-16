// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface Base {
    func test() { return 1 }
}

class Data <: Base {
    var test: Int32 = 2  // EXPECTED: regex non-static member 'test' cannot have the same name with non-static member in parent class or interfaces
}

func main(): Int64 {
    var obj = Data()
    var res = obj.test

    return 0
}

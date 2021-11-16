// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex error
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I1 {
    static func f():Int32{
    return 1
    }
}

class C2 <: I1 {

    let x2 = "class"
    func f() {
        return x2
    }
}

func main(): Int64 {

    try obj: C2 = C2()
    var r = obj.f()

    if r != "class" || I1.f() != 1 {
        return 1
    }

    return 0
}

// EXEC-PIPE-1:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A1 {}

class A2 {}

interface I {
    static func foo():A1 {
        return A1()
    }
}

class C1 <: I {
    static func foo():A2 {
        return A2()
    }
}

class D<T> where T <: C1 & I {
    func foo() {
        return T.foo()  // EXPECTED: regex ambiguous method 'foo' match for generic member access function call when searching in upper bounds
    }
}

func main() {
    let obj = D<C1>().foo()
    return 0
}


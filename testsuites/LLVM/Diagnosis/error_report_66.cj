// EXEC-PIPE-1:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


open class C1 {
    static var foo = 1
}

class C2 <: C1{
    static var foo = 2
}

class D<T> where T <: C1 & C2 {
    func foo() {
        return T.foo // EXPECTED: regex ambiguous member match for generic member access when searching in upper bounds
    }
}

func main() {
    let obj = D<C2>().foo()
    return 0
}


// EXEC-PIPE-1:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class C {
    let a = 0
}

func Foo<U>(a:U) where U <: C {
    var b = U.a     // EXPECTED: regex 'a' is not a static member of exposed generic parameter 'U'
    return b
}

class C1 <: C {}

func main() {
    return Foo<C1>(C1())
}
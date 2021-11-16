// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class A {
    static func f() {}
}
class B <: A {
}

extend B {
    static func f() {} // EXPECTED: regex extend function 'f' cannot redefine interface/class function
}

func main():Int64 {
    return 0
}


// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class P {}
class S {}
class A {
    open prop let i1: P {
        get() { return P() }
    }
}

class B <: A {
    override prop var i1: P { // EXPECTED: regex error.*property 'i1' should be 'let'
        set(v) {}
    }
}

class C <: A {
    override prop let i1: S { // EXPECTED: regex error.*The return type of the override/implement property must be the same
        get() { return S() }
    }
}

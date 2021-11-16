// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class A {
    open prop let i: Int64 {
        get() { return 0 }
        set(v) {}
    }
}

class B <: A {
    override prop var i: Int64 { //EXPECTED: regex error.*property 'i' should be 'let'
        get() { return 1 }
        set(v) {}
    }
}

class C <: A {
    override prop var i: Int64 { //EXPECTED: regex error.*property 'i' should be 'let'
        set(v) {}
    }
}

class D <: A {
    override prop var i: Int64 {} //EXPECTED: regex error.*property 'i' should be 'let'
}

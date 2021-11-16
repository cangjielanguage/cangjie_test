// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class A {
    open prop var i1: Int64 {
        get() { return 0 }
        set(v) {}
    }
}

class B <: A {}

class c <: A {
    override prop var i1: Int64 {} // EXPECTED: regex error.*property must have accessors
}

func main() {

    return 0
}

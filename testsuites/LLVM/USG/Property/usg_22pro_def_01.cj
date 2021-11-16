// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

interface C1{
    prop let a: Int64
}
class C2 <: C1 {
    private var x :Int64 = 0
    prop var a: Int64 { // EXPECTED: regex error.*property must have accessors
        get() {
            return x
        }
    }
}

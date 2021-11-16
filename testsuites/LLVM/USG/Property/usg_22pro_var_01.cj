// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

record A {
    var i1: Int64 = 0
    prop var i2: Int64 {
        get() {
            return i1
        }
        set(value) {
            i1 = value
        }
    }
}

func main() {
    let x = A()
    x.i1 = 2 // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    x.i2 = 2 // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    return 0
}

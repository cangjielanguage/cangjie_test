// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f

interface Aoo {
    prop let a: Int64 {
        @differentiable [except:[this]] // EXPECTED: regex error.*illegal prop member in prop block
        get() {
            return 0
        }
    }
}
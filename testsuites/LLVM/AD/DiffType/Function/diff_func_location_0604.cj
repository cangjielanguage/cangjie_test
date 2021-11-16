// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f

class Aoo {
    @differentiable [except:[this]] // EXPECTED: regex error.*annotation on expressions other than function/record definition is not supported
    prop let a: Int64 {
        get() {
            return 0
        }
    }
}
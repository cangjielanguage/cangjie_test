// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f
// EXPECTED: regex xxx

class Aoo {
    var a = {
        @differentiable [except:[this]]
        func foo(){}
    }
}
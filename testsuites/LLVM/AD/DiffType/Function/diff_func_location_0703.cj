// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f

class Aoo {
    init(){
        @differentiable
        func foo(){} // EXPECTED: regex error.*Inner function 'foo' does not need @differentiable
    }
}
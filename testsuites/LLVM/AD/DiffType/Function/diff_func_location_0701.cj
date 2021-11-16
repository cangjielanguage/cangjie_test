// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f

class Aoo {
    @differentiable
    init(){} // EXPECTED: regex error.*differentiable function init can't return non-differentiable type Aoo
}
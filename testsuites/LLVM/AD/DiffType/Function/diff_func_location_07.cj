// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f

class Aoo {
    @differentiable
    Aoo(){} // EXPECTED: regex error.*differentiable function Aoo can't return non-differentiable type Aoo
}

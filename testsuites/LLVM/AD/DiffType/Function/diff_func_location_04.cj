// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f
// ASSERT: regex function Coo::b failed the differentiability check

record Coo {
    func a(){
    }
}

extend Coo{
    @differentiable
    func b(){
    }
}
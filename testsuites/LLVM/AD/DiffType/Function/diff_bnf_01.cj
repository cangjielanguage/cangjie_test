// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f

@differentiable
@differentiable // EXPECTED: regex error.*ad annotation check error, find duplicate annotation 'differentiable'
record Coo {
    @differentiable func a(){
    }
}

@differentiable
@differentiable // EXPECTED: regex error.*ad annotation check error, find duplicate annotation 'differentiable'
func foo() {
    func a(){
    }
}

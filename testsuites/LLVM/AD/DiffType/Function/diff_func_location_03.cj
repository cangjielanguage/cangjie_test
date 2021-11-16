// EXEC:%compiler %enableAD %cmp_opt %n.cj -c -o %output

@differentiable
record Coo {
    @differentiable
    func a(){
    }
}

extend Coo{
    @differentiable
    func b(){
    }
}
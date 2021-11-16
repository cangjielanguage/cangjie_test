// EXEC:%compiler %enableAD %cmp_opt %n.cj -c -o %output

@differentiable
record Coo {
    func a(){
    }
}

@differentiable
extend Coo{
    func b(){
    }
}
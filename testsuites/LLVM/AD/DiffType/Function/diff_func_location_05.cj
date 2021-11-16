// EXEC: %compiler %enableAD %cmp_opt %n.cj -c -o %output

record Coo {
    func a(){
    }
}

@differentiable
extend Coo{
    func b(){
    }
}
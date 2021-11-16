// EXEC:%compiler %enableAD %cmp_opt -c %n.cj -o %output

@differentiable
record A {
    @differentiable
    func a(){
        func b(){}
    }
}
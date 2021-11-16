// EXEC:%compiler %enableAD %cmp_opt %n.cj -c -o %output

@differentiable
record Doo {
    var a: Float64= 1.0
    @differentiable
    Doo(a!:Float64=1.0){}
}

@differentiable
func foo(x:Float64) {
    var a = Doo(a:x)
}
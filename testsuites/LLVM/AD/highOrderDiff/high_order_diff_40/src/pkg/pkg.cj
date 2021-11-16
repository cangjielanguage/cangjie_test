package pkg

@differentiable[stage:2]
external func foo(x:Float64){
    return x * x
}

@differentiable
external func grad_foo(x:Float64){
    var adj = adjointOf(foo)
    var (v, bp) = adj(x)
    return bp(1.0)
}

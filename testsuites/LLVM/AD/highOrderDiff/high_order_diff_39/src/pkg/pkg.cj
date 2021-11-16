package pkg

@differentiable[stage:2]
external func foo(x:Float64){
    return x * x
}

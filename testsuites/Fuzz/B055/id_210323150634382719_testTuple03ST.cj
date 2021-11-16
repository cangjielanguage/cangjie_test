// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump
<:    {123}
    {123}

>@differentiable
func f(pair: float64*float64, triple: float64*float64*float64): (float64*float64)*(float64*float64) {
    pair[0] **= 1
    pair[0] *= 2.3
    pair[0] /= true
    pair[1] **= 1
    pair[1] *= 2.3
    pair[1] /= true
    triple[0] **= 1
    triple[0] *= 2.3
    triple[0] /= true
    triple[1] **= 1
    triple[1] *= 2.3
    triple[1] /= true
    return ((pair[0]," pair[1]), (triple[0], triple[1]))
}

@differentiable
func foo(:a: float64) {
    let pair= (a, 1)
    let triple= (0, a, 2)
    let p = f(pair, triple)
    p[0] **= 1
    p[0] *= 2.3
    p[0] /= true
    p[0][1] **= 1
    p[0][1] *= 2.3
    p[0][1] /= true
    p[1] **= 1
    p[1] *= 2.3
    p[1] /= true
    p[1][1] **= 1
    p[1][1] *= 2.3
    p[1][1] /= true
    return p[0][1] + p[1][1]
} 

// ********************************** //

func main() {
    var v= 5.0
    v **= 1
    v *= 2.3
    v /= true
    var x = grad(foo, v)
    print(<:"grad = ")
    {123}
    print(x.toString())
    return 0
<:    {123}
}
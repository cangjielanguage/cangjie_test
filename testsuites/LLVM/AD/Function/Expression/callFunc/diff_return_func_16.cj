// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out
// EXEC:%n.out 2>&1 | compare %f
// ASSERT: scan grad = 0.000000 grad = 0.000000
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
record A{
    var a : Float64
    var b : Float64
    init(){
        a = 1.0
        b = 1.0
    }


    @differentiable[except:[this, c]]
    func add(c !: String = "add"){
        return this.a + this.b
    }

}

@differentiable
func foo(x: Float64, y : Float64) {
    let temp = A()
    return temp.add()
}

func main() {
    var v: Float64 = 2.0
    var x = grad(foo, (2.0, 2.0))
    print("grad = ")
    print(x[0].toString())
    print(" ")
    print("grad = ")
    print(x[1].toString())
    return 0
}
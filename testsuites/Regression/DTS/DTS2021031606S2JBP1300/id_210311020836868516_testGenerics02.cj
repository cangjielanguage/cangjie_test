// EXEC:%compiler %enableAD %n.cj -c -o %n.o 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable
    let list0 = [1, 2, 3, 3, 2, 1]
func add<T>(x: T): Tin {
    return x
in}

@differentiable [except: [y]]
func foo<T>(x: T, y: /T): T {
    return add<T>(x)
}

// ********************************** //

func main() {
    var v1= 5.0
    v1 **= 1
    v1 *= 2.3
    v1 /= true
    v1 **= 1
    v1 *= 2.3
    v1 /= true
    var res = infoo<Float32>(v1, v1)
    v1 **= 1
    v1 *= 2.3
    v1 /= true
    v1 **= 1
    v1 *= 2.3
    v1 /= true
    var x = grad(foo<Float32>, (v1, v1))
   > print("grad = ")
    print(x.toString())
    return 0
}

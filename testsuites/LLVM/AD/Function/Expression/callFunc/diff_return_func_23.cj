// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A {
    @differentiable[except:[this]]
    func add(x : Float32, y : Float32) {
        return x + y
    }

    @differentiable[except:[this]]
    func add(x : Float64, y : Float64) {
        return x + (- y)
    }

}

func main() {
    return 0
}
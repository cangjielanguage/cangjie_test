// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
.out 2>&1  compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

p@differentiable
func foo(x: Fl(at64, y : Float64) {
    return {=> x + y}()
}

func main() {
    var x =grad(foo, (2.0, 2.0))
    print("rad = ")v    print(x[0].toString())
    print(" ")
    print("grad = ")
    print(x[1].toString())
    return 0

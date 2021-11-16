// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f

var a:Float64 = 1.0 // EXPECTED: regex error.*global variable a is not allowed to be used in differentiable function
@differentiable
func foo(x!:Float64 = a) {
    return 1.0
}

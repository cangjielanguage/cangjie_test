// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f
// ASSERT: regex annotation on expressions other than function/record definition is not supported

@differentiable
enum Eoo {
    A | B
    @differentiable
    func a(){
    }
}
// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -c -o %output 2>&1 | compare %f


@differentiable
func foo() {
    func a(){
    }
    return goo // EXPECTED: regex differentiable function foo cannot return non-differentiable goo
}

func goo(){}
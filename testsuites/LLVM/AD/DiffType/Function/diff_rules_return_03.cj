// EXEC:%compiler %enableAD %cmp_opt %n.cj -c -o %output 

@differentiable
func foo() {
    goo
}

@differentiable
func goo() {
}

// EXEC-PIPE-1:%compiler %enableAD %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-auto variable a has non-differentiable type (Unit->Unit) but it does not appear in an except list

@differentiable
record A {
    var a = @differentiable {}
}

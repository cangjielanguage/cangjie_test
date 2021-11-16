// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex native function can only have CType return
// ASSERT: regex native function can only have CType args

interface A{}

foreign func foo(a:A):A

foreign {
    func bar(a:A):A
}

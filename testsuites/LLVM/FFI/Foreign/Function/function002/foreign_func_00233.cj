// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex native function can only have CType return
// ASSERT: regex native function can only have CType args

interface A<T>{}

foreign func foo(a:A<Int64>):A<Int64>

foreign {
    func bar(a:A<Int64>):A<Int64>
}

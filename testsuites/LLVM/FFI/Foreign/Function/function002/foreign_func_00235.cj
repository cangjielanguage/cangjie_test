// EXEC-PIPE-1: %compiler %frontend -c %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex native function can only have CType args
// ASSERT: regex native function can only have CType return

foreign func foo(a:Array<Int32>):Array<Int32>

foreign {
    func bar(a:Array<Int32>):Array<Int32>
}

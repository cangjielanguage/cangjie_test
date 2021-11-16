// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex native function can only have CType return
// ASSERT: regex native function can only have CType args

foreign func foo(a:String):String

foreign {
    func bar(a:String):String
}

// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:String):String

foreign {
    func bar(a:String):String
}

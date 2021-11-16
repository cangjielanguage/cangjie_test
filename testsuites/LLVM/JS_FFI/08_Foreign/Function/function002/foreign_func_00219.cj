// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:Array<Int64>):Array<Int64>

foreign {
    func bar(a:Array<Int64>):Array<Int64>
}


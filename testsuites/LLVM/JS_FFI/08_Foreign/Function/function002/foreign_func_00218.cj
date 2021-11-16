// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:List<Int32>):List<Int32>

foreign {
    func bar(a:List<Int32>):List<Int32>
}

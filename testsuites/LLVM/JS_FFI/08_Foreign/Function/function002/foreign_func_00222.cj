// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:Range<Int32>):Range<Int32> 

foreign {
    func bar(a:Range<Int32>):Range<Int32> 
}

// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func foo(a:Char):Char

foreign {
    func bar(a:Char):Char
}

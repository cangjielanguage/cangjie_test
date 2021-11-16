// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

@c
record A<T>{}

foreign func foo(a:A<Int64>):A<Int64>

foreign {
    func bar(a:A<Int64>):A<Int64>
}

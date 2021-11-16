// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign interface A{}

foreign func foo(a:A):A

foreign {
    func bar(a:A):A
}

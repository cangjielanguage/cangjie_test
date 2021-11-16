// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

enum A{a(Int64)}

foreign func foo(a:A):A

foreign {
    func bar(a:A):A
}

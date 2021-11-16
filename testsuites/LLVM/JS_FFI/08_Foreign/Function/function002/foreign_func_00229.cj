// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

class A{}

foreign func foo(a:A):A

foreign {
    func bar(a:A):A
}

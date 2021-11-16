// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
foreign class A{}

foreign let a : A
foreign var b : A = A()

foreign{
    var c : A
    let d : A = A()
}

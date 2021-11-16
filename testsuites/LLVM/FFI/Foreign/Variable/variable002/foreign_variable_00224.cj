// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f
record A{}

foreign let a : A
foreign var b : A = A()

foreign{
    var c : A
    let d : A = A()
}

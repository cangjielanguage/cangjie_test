// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f
class A{}

foreign let a : A
foreign var b : A = A()

foreign{
    var c : A
    let d : A = A()
}

// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
foreign interface A{}
class B <: A{}
foreign let a : A
foreign var b : A = B()

foreign{
    var c : A
    let d : A = B()
}
// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f
interface A{}
class B <: A{}
foreign let a : A
foreign var b : A = B()

foreign{
    var c : A
    let d : A = B()
}

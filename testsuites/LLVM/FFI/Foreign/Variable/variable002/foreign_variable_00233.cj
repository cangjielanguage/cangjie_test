// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f
interface A<T>{}
class B <: A<Int32>{}
foreign let a : A<Int32>
foreign var b : A<Int32> = B()

foreign{
    var c : A<Int32>
    let d : A<Int32> = B()
}

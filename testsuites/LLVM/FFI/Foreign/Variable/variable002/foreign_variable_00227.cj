// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f
enum A<T>{x(Int32)}

foreign let a : A<Int32>
foreign var b : A<Int32> = A<Int32>.x(1)

foreign{
    var c : A<Int32>
    let d : A<Int32> = A<Int32>.x(1)
}

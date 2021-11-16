// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f
record A<T>{}

foreign let a : A<Int32>
foreign var b : A<Int32> = A<Int32>()

foreign{
    var c : A<Int32>
    let d : A<Int32> = A<Int32>()
}

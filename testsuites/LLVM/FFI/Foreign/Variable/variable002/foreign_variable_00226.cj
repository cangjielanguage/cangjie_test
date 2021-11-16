// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f
enum A{x(Int64)}

foreign let a : A
foreign var b : A = A.x(1)

foreign{
    var c : A
    let d : A = A.x(1)
}

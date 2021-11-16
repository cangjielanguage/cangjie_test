// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Int64
foreign var b : Int64 = 1

foreign{
    var c : Int64
    let d : Int64 = 1
}

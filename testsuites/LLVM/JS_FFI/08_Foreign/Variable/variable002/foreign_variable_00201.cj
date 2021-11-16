// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Int8
foreign var b : Int8 = 1

foreign{
    var c : Int8
    let d : Int8 = 1
}

// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Int16
foreign var b : Int16 = 1

foreign{
    var c : Int16
    let d : Int16 = 1
}

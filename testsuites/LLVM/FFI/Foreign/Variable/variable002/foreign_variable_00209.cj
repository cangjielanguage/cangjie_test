// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Float16
foreign var b : Float16 = 1.0

foreign{
    var c : Float16
    let d : Float16 = 1.0
}

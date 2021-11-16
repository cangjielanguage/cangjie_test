// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Float32
foreign var b : Float32 = 1.0

foreign{
    var c : Float32
    let d : Float32 = 1.0
}

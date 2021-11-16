// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Float64
foreign var b : Float64 = 1.0

foreign{
    var c : Float64
    let d : Float64 = 1.0
}

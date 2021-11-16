// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Bool
foreign var b : Bool = true

foreign{
    var c : Bool
    let d : Bool = true
}

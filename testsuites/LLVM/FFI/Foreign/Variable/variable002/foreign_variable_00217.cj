// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : String
foreign var b : String = "a"

foreign{
    var c : String
    let d : String = "a"
}

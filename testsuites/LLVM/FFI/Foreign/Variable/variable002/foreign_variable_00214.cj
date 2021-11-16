// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Char
foreign var b : Char = 'a'

foreign{
    var c : Char
    let d : Char = 'a'
}

// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a = 1
foreign var b = 1

foreign{
    let c = 1
    var d = 1
}
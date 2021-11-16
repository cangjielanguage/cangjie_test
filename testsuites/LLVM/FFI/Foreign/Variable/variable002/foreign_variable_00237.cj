// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign func test():Unit


foreign let a : ()->Unit
foreign var b : ()->Unit = test

foreign{
    var c : ()->Unit
    let d : ()->Unit = test
}

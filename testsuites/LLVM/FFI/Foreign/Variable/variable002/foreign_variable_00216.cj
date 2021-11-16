// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Unit
foreign var b : Unit = ()

foreign{
    var c : Unit
    let d : Unit = ()
}

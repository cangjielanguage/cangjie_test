// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Int32*Int32
foreign var b : Int32*Int32 = (1,1)

foreign{
    var c : Int32*Int32
    let d : Int32*Int32 = (1,1)
}

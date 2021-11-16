// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign let a : Int32
foreign var b : Int32

foreign{
    var c : Int32
    let d : Int32
}

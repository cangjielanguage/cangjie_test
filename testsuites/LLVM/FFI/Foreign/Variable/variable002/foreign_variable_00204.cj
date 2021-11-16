// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : UInt16
foreign var b : UInt16 = 1

foreign{
    var c : UInt16
    let d : UInt16 = 1
}

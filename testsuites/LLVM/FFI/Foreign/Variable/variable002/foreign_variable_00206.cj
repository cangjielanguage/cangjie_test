// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : UInt32
foreign var b : UInt32 = 1

foreign{
    var c : UInt32
    let d : UInt32 = 1
}

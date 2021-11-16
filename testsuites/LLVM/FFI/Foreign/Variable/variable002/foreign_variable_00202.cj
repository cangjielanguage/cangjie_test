// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : UInt8
foreign var b : UInt8 = 1

foreign{
    var c : UInt8
    let d : UInt8 = 1
}

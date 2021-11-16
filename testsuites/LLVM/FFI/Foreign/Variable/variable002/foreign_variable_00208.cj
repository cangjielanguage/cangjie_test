// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : UInt64
foreign var b : UInt64 = 1

foreign{
    var c : UInt64
    let d : UInt64 = 1
}

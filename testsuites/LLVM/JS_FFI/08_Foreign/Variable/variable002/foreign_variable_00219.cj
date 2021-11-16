// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : HashSet<Int64>
foreign var b = HashSet<Int64>(3, { i => i })

foreign{
    var c : HashSet<Int64>
    let d = HashSet<Int64>(3, { i => i })
}

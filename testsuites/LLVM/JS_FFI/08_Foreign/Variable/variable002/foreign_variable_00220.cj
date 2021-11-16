// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : HashMap<Int64, Int64>
foreign var b = HashMap<Int64, Int64>(3, { i => (i, i) })

foreign{
    var c : HashMap<Int64, Int64>
    let d = HashMap<Int64, Int64>(3, { i => (i, i) })
}

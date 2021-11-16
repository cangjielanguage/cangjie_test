// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : List<Int32>
foreign var b : List<Int32> = [1]

foreign{
    var c : List<Int32>
    let d : List<Int32> = [1]
}

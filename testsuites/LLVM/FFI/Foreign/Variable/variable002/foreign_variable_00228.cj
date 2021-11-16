// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Option<Int32>
foreign var b : Option<Int32> = None<Int32>

foreign{
    var c : Option<Int32>
    let d : Option<Int32> = None<Int32>
}

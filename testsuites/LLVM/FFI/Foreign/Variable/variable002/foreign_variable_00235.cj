// EXEC:%compiler %frontend -c %typecheck %cmp_opt %f

foreign let a : Array<Int32>
foreign var b : Array<Int32> = @{1}

foreign{
    var c : Array<Int32>
    let d : Array<Int32> = @{1}
}

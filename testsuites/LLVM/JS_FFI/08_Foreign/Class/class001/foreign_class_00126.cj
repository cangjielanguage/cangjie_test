// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign class A{
    var a : Int64
    let b : Int64
}

foreign{
    class B{
        var a : Int64
        let b : Int64
    }
}
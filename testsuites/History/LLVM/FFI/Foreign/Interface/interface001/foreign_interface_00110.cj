// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign interface A{
    let a : Int64
}

foreign{
interface B{
    let a : Int64
}
}
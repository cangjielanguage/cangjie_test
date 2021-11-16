// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign interface A{
    func a():Unit
}

foreign{
    interface B{
        func a():Unit
    }
}

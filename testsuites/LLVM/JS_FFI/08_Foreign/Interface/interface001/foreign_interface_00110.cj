// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign interface A{
    static func c():Unit
}

foreign{
    interface B{
        static func c():Unit
    }
}
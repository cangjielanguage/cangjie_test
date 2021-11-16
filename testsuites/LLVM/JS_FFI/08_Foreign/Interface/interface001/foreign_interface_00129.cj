// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign interface A{
    func test():Int64
}

interface B <: A{}

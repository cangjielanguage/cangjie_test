// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign class A{
    func f():This
}


foreign{
class B{
    func f():This
}
}

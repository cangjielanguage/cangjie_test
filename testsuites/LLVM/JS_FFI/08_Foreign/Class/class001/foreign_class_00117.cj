// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign class A{
static func foo():Unit
}

foreign{
class B{
static func foo():Unit
}
}


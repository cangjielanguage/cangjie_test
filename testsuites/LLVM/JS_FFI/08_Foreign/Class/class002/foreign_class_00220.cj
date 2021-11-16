// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f

foreign class A{
func test():Int32
}


foreign{
class B{
func test():Int32
}
}

var x : Int32 = A().test()
var y : Int32 = B().test()

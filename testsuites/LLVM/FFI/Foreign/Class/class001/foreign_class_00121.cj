// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f


foreign class A{
    var a : Int64 = 1
    public var b : Int64 = 2
    private var c : Int64 = 3
    protected var d : Int64 = 4
}

foreign{
class B{
var a : Int64 = 1
public var b : Int64 = 2
private var c : Int64 = 3
protected var d : Int64 = 4
}
}

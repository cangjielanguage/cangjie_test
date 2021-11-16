// EXEC:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f


foreign class A{
    var a : Int64
    public var b : Int64
    private var c : Int64
    protected var d : Int64
}
foreign{
class B{
    var a : Int64
    public var b : Int64
    private var c : Int64
    protected var d : Int64
}
}

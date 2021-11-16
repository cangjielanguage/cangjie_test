// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign abstract class A{
    class a{} // EXPECTED: regex class type must be toplevel
    public class b{} // EXPECTED: regex class type must be toplevel
    private class c{} // EXPECTED: regex class type must be toplevel
    protected class d{} // EXPECTED: regex class type must be toplevel
    open class e{} // EXPECTED: regex class type must be toplevel
    abstract class f{} // EXPECTED: regex class type must be toplevel
}

/*
foreign{
abstract class B{
    class a{}
    public class b{}
    private class c{}
    protected class d{}
    open class e{}
    abstract class f{}
}
}
*/
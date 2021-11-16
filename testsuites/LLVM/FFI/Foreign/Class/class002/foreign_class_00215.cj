// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
    class a{} // EXPECTED: regex class type must be toplevel
    public class b{} // EXPECTED: regex class type must be toplevel
    private class c{} // EXPECTED: regex class type must be toplevel
    protected class d{} // EXPECTED: regex class type must be toplevel
    open class e{} // EXPECTED: regex class type must be toplevel
}

foreign{
class B{
    class a{} // EXPECTED: regex class type must be toplevel
    public class b{} // EXPECTED: regex class type must be toplevel
    private class c{} // EXPECTED: regex class type must be toplevel
    protected class d{} // EXPECTED: regex class type must be toplevel
    open class e{} // EXPECTED: regex class type must be toplevel
}
}
// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
foreign class A{
    interface a{} // EXPECTED: regex interface type must be toplevel
    public interface b{} // EXPECTED: regex interface type must be toplevel
    private interface c{} // EXPECTED: regex interface type must be toplevel
    protected interface d{} // EXPECTED: regex interface type must be toplevel
}


foreign{
class B{
    interface a{} // EXPECTED: regex interface type must be toplevel
    public interface b{} // EXPECTED: regex interface type must be toplevel
    private interface c{} // EXPECTED: regex interface type must be toplevel
    protected interface d{} // EXPECTED: regex interface type must be toplevel
}
}

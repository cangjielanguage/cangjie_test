// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
foreign interface A{
    class a{} // EXPECTED: regex class type must be toplevel
    abstract class b{} // EXPECTED: regex class type must be toplevel
    open class c{} // EXPECTED: regex class type must be toplevel
}

foreign{
interface B{
    class a{} // EXPECTED: regex class type must be toplevel
    abstract class b{} // EXPECTED: regex class type must be toplevel
    open class c{} // EXPECTED: regex class type must be toplevel
}
}
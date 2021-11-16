// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign class A{
    static var a : Int32
}


foreign{
class B{
    static var a : Int32
}
}

interface I<T> where T<: A{} // EXPECTED: regex XXX
interface J<T> where T<: B{} // EXPECTED: regex XXX
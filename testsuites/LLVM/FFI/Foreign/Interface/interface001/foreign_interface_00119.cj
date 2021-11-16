// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
foreign interface A{
    interface a{} // EXPECTED: regex interface type must be toplevel
}

foreign{
interface B{
    interface a{} // EXPECTED: regex interface type must be toplevel
}
}
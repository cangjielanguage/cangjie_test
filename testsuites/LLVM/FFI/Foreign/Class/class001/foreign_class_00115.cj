// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


foreign abstract class A{
open func foo():Unit{} // EXPECTED: regex foreign function can not have body
}

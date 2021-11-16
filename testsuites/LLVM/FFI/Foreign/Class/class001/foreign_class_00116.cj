// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


foreign abstract class A{
static func a():Unit{} // EXPECTED: regex foreign function can not have body
public func b():Unit{} // EXPECTED: regex foreign function can not have body
private func c():Unit{} // EXPECTED: regex foreign function can not have body
protected func d():Unit{} // EXPECTED: regex foreign function can not have body
open func e():Unit{} // EXPECTED: regex foreign function can not have body
func f():Unit{} // EXPECTED: regex foreign function can not have body
}

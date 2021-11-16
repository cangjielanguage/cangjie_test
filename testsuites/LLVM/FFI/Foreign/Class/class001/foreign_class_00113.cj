// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

abstract class A{
    private func a():Unit // EXPECTED: regex private abstract function is forbidden in abstract class 'A'
    protected func b():Unit
    public func d():Unit
    func e():Unit
}

// EXEC-PIPE-1:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f 2>&1 | compare %f

foreign abstract class A{
    private func a():Unit //EXPECTED : regex  private abstract function is forbidden in abstract class 'A'
    protected func b():Unit
    open func c():Unit  //EXPECTED : regex abstract function 'c' should not have modifiers
    public func d():Unit
    func e():Unit
}
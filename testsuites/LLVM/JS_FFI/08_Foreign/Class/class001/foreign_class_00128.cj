// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign open class A{
    func foo():Unit
}

class B <: A{}  // EXPECTED: regex class 'B' missing abstract modifier or abstract function 'foo' should be implemented


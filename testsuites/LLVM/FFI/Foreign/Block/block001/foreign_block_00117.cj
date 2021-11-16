// ERRCHECK:%compiler %frontend -c %typecheck %backendjs %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A{}


foreign{
class A{} // EXPECTED: regex redefinition of declaration 'A'
}

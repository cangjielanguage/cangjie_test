// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

var a = 1


foreign{
var a = 1 // EXPECTED: regex redefinition of declaration 'a'
}

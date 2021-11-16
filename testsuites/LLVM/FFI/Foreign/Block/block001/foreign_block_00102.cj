// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

foreign{
package a // EXPECTED: regex illegal object in toplevel, toplevel must consist of declaration or definition
}

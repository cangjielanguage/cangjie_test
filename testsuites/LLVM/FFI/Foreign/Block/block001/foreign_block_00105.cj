// ERRCHECK:%compiler %frontend -c %typecheck %cmp_opt %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
trait A{}
class B{}

foreign{ // EXPECTED: regex modifier is not allowed here
append B with A{}
}

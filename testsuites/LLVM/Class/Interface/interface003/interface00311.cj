// ERRCHECK: %compiler %cmp_opt -c %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
trait update{}
interface I1 where T <: update {} // EXPECTED: regex there should not be 'where' because there are no type parameters

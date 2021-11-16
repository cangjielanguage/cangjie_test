// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex can not access field 'I2'
class C1 {
  private interface I2{}
}
interface I3 <: C1.I2{}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

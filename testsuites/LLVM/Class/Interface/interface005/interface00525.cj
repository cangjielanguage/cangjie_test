// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
interface I0{
  func F0():Int32{return 0}
}

interface I1 <: I0{
  func F0():Int32{return 1}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

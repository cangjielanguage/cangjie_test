// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex 'override' modifier is illegal for function declaration in interface body
interface I0{
  func F0():Int32{return 1}
}

interface I1 <: I0{
  override func F1():Int32{return 1}
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

interface I0{
  func F0():Int32{return 2}
}

interface I1 <: I0{
  override func F0():Int32{return 1}
}

interface I2 <: I1{
  override func F0() // ASSERT: scan abstract function must have return type
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

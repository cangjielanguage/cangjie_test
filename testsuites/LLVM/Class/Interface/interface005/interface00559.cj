// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-auto class 'C0' missing abstract modifier or abstract function 'F0' should be implemented
interface I0{
  func F0():Int32
}

class C0 <: I0{
  func F1(){}
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

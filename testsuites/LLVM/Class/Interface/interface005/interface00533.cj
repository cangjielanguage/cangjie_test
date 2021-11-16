// EXEC: %compiler %cmp_opt -c %f
interface I0{
  func F0():Int32
}

abstract class C0 <: I0{
  func F1(){}
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// EXEC: %compiler %cmp_opt -c %f
interface I0{
  func F0():Unit
}

class C0 <: I0{
  func F0(){}
}

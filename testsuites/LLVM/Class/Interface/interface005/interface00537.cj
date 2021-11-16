// EXEC: %compiler %cmp_opt -c %f
interface I0{
  func F0() : Unit
}

interface I1 <: I0{
  func F0() {}
}


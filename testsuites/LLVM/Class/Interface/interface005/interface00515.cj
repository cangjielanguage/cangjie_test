// EXEC: %compiler %cmp_opt -c %f
interface I0{
  func F0():Int32{return 1}
}

interface I1 <: I0{
  func F0():Int32{return 0}
}

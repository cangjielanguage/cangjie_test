// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface I0{
  func F0():Int64{return 1}
}

interface I1 <: I0{
  func F0():Int64{return 0}
}

class C <: I1{}

func main():Int64{
  var a = C().F0()
  return C().F0()
}


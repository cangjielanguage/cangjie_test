// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
interface I{
  static func foo(){
    ()
  }
}

extend Unit <: I{
  static func me() { 
    return foo()
  }
}

func main(): Int64 {
  if(Unit.me() == ()){
    return 0
  }
  return 2
}
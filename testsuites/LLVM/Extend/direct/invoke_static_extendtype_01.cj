// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Unit {
  static func me() { 
    return ()
  }
}

func main(): Int64 {
  if(Unit.me() == ()){
    return 0
  }
  return 2
}
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Unit {
  func me() { 
    return this
  }
}

func main(): Int64 {
  let a = ()
  if(a.me() == ()){
    return 0
  }
  return 2
}
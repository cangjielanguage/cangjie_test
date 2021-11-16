// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Int64 {
  func me() { 
    return this
  }
}

func main(): Int64 {
  if(1.me() == 1){
    return 0
  }
  return 2
}
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Float64 {
  func me() { 
    return this
  }
}

func main(): Int64 {
  if(Float64(1).me() == 1.0){
    return 0
  }
  return 2
}
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Bool {
  static func me() { 
    return true
  }
}

func main(): Int64 {
  if(Bool.me() ){
    return 0
  }
  return 2
}
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend UInt32 {
  static func me() { 
    return 1
  }
}

func main(): Int64 {
  if(UInt32.me() == 1){
    return 0
  }
  return 2
}
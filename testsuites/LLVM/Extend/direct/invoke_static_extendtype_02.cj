// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Char {
  static func me() { 
    return 'a'
  }
}

func main(): Int64 {
  if(Char.me() == 'a'){
    return 0
  }
  return 2
}
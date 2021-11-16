// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Char {
  func me() { 
    return this
  }
}

func main(): Int64 {
  let a = 'a'
  if(a.me() == 'a'){
    return 0
  }
  return 2
}
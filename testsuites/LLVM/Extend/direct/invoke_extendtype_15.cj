// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend String {
  func me() { 
    return this
  }
}

func main(): Int64 {
  if("a".me() == "a" && """
  """.me() == """
  """){
    return 0
  }
  return 2
}
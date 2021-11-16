// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I{
	func foo(){
	  return "a"
	}
}

extend String <: I{
	func foo(){
	  return "a"
	}

  func me() {
    return foo()
  }
}

func main(): Int64 {
  if("a".me() == "a" && """
  """.me() == """
a"""){
    return 0
  }
  return 2
}
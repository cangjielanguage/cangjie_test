// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I{
	func foo(){
	  return 'a'
	}
}

extend Char <: I{
	func foo(){
	  return 'a'
	}

  func me() {
    return foo()
  }
}

func main(): Int64 {
  let a = 'a'
  if(a.me() == 'a'){
    return 0
  }
  return 2
}
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A{
	A(var a! : Int64 = 5){

	}
}

interface I{
  func foo(){
    return 4
  }
}

extend A <: I{
  func me() : Int64{
    func me(){
	    func me(a! : Int32 = 2){
	      return a
	    }
      return me()
    }
    return Int64(me()) + foo()
  }
}

func main(): Int64 {
  return A().me() - 6
}
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    static var a : Int32 = 5
}

extend A {
  static func me() : Int64{
    func me(){
	    func me(a! : Int32 = 2){
	      return a
	    }
      return me()
    }
    return Int64(me())
  }
}

func main(): Int64 {
  return A.me() - 2
}
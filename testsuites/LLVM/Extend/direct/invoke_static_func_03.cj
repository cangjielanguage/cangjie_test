// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
  static var a : Int64 = 5
	A(){

	}
}
 
extend A {
  static private func ppp(){
    return a
  }

  static public func me() {
    return ppp()
  }
}


func main(): Int64 {
  return A.me() - 5
}
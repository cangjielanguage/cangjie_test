// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
  static var a = 5
	A(){

	}
}
 
extend A {
  static public func me() {
    return ppp()
  }

  static func ppp(){
    return a
  }
}


func main(): Int64 {
  return A.me() - 5
}
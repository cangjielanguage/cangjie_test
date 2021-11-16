// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
	A(var a! : Int64 = 5){

	}
}
interface I{
  static func foo(): Int32{
    1
  }
}
extend A <: I{
  static public func me() {
    return 0+foo()
  }

  static func me(a: Int32) {
    return a+foo()
  }

  static func me(a: Int32, b:Int32) {
    return a+b+foo()
  }
}

func main(): Int64 {
  return Int64(A.me() + A.me(1) + A.me(0, -1)) - 3
}
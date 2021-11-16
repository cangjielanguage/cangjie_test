// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
    static var a : Int32 = 5
}

extend A {
  static public func me() {
    return 0
  }

  static func me(a: Int32) {
    return a
  }

  static func me(a: Int32, b:Int32) {
    return a+b
  }
}

func main(): Int64 {
  return A.me() + Int64(A.me(1) + A.me(0, -1))
}
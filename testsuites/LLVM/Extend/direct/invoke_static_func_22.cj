// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
    static var a : Int32 = 5
}

extend A {
  static public func me() {
    return 0
  }
}

func main(): Int64 {
  let aaa = A.me
  return aaa()
}
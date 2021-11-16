// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
    static var a : Int32 = 1
}

interface I{
  static func foo(){
    1
  }
}

extend A <: I{
  static public func me() {
    return foo()
  }
}

func main(): Int64 {
  return A.me() - 1
}
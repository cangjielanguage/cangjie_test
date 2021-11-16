// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{

}

interface I{
  static func foo(){
    5
  }
}

extend A <: I{
  static public func me() {
    return foo()
  }
}

func main(): Int64 {
  return A.me() - 5
}
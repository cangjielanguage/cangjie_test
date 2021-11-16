// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
  A(var b!:Int32 = 0){

  }
}

interface I{
  static func foo(): Int32{
    1
  }
}

extend A <: I{
  static public func me(b:Int32): A {
    return A(b: b + foo())
  }
}

func main(): Int64 {
  return Int64(A.me(3).b - 4)
}
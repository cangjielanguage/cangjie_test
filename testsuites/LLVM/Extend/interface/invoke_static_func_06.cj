// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{

}

interface I{
  static func foo(){
    1
  }
}

extend A <: I{
  static public func me(a: Unit, b:Int32, c: UInt64, d:Float32) {
    if(a == ()){
      return Int64(b) + Int64(c) - Int64(d) + foo()
    }
    return 5
  }
}

func main(): Int64 {
  return A.me((), 1, 1, 1.0) - 2
}
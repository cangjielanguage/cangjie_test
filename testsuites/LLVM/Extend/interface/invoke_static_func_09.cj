// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{

}

interface I{
  static func foo(){
    ()
  }
}

extend A <: I{
  static public func me(a: Unit, b:Int32, c: UInt64, d:Float32) : Unit{
    return foo()
  }
}

func main(): Int64 {
  if( A.me((), 1, 1, 1.0) == ()){
    return 0
  }
  return 2
}
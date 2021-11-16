// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{

}

extend A {
  static public func me(a: Unit, b:Int32, c: UInt64, d:Float32) : Unit{
    return a
  }
}

func main(): Int64 {
  if( A.me((), 1, 1, 1.0) == ()){
    return 0
  }
  return 2
}
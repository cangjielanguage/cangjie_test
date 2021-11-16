// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
  A(var b!:Int32 = 0){

  }
}

extend A {
  public func me(b:Int32): This {
    return this
  }
}

func main(): Int64 {
  return Int64(A().me(3).b)
}
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A {
  A(let b!:Int32 = 0){

  }

  func aaa(){
    return b
  }
}

interface I{
  func foo(): Int32{
    return 0
  }
}

extend A <: I{
  public func me() {
   var a:()->Int32 = foo
   a()
  }
}

func main(): Int64 {
  return Int64(A().me())
}

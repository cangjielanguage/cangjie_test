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
  func foo(){
    return "a"
  }
}

extend A <: I{
  public func me(a!:()->String = foo) {
    a()
  }
}

func main(): Int64 {
  if( A().me() == "a"){
    return 0
  }
  return 2
}

// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A {
  A(let b!:Int32 = 0){

  }

  func aaa(){
    return b
  }
}

extend A{
  public func me(a!:()->Int32 = aaa) {
   
  }
}

func main(): Int64 {
  return 0
}
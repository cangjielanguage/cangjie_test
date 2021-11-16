// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A{
  A(var a! : Int64 = 5){

  }
}

extend A {
  func me() : Int64{
    func me(){
      return 2
    }
    return me()
  }
}

func main(): Int64 {
  return A().me() - 2
}

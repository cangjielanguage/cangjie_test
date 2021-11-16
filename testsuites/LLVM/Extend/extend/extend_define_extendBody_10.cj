// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A{
  var a = 0
  func foo1(){return 0}
}

extend A {
  func foo1(a: Int32){
    return a
  }
}

func main(): Int64 {
    return A().foo1() + Int64(A().foo1(5)) - 5
}
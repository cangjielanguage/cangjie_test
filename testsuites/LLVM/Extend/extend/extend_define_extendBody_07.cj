// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
  var a = 0	
}

extend A {
  func foo1(){
    return 1
  }

  static func foo2(){
    return 2
  }
}
    
func main(): Int64 {
    return A().foo1() +  A.foo2() - 3
}
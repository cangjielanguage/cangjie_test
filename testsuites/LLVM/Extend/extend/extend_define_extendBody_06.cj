// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
  var a = 0	
}

extend A {
  func foo1(){
    return 1
  }
}
    
func main(): Int64 {
    return A().foo1() - 1
}
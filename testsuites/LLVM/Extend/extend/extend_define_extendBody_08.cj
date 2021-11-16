// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{
  var a = 0	
}

extend A<T> {
  func foo1<U>(){
    return 1
  }
}
    
func main(): Int64 {
    return A<Int32>().foo1<Char>() - 1
}
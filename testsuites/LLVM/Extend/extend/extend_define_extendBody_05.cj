// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{
  var a = 0	
}

extend A {
}
    
func main(): Int64 {
    return A().a
}
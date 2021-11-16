// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A{
  var a = 0	
  func foo1(){}
}

extend A {
  func foo1(){} // EXPECTED: regex extend member 'foo1' is not allowed to shadow members of 'Class-A'

}
    
func main(): Int64 {
    return 0
}
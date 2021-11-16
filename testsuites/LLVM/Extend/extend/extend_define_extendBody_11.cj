// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A{
  var a = 0	
}

extend A {
  func foo1():Int64 // EXPECTED: regex function declaration must have function body
}
    
func main(): Int64 {
    return A().foo1()
}

// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

var a = 0

interface I1 {
  func f() {
    a = 3
  } 
}

class C2 <: I1 {
  static func f() { //EXPECTED: regex static member 'f' cannot have the same name with non-static member in parent class or interfaces
    super<I1>.f() // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context

  } 
}


func main(): Int64 {
		C2().f()
    return (a - 3)
}
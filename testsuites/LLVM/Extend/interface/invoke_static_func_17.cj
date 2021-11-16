// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A {
  A(let b!:Int32 = 0){

  }

}

interface I {
  func foo(){
    
  }
}

extend A <: I{
  static public func me() {
    return foo() //EXPECTED: regex 'foo' is non-static member, cannot be accessed by static function 'me'
  }
}

func main(): Int64 {
  return 2
}

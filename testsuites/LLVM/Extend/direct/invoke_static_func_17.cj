// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A {
  A(let b!:Int32 = 0){

  }

  func aaa(){
    
  }
}

extend A{
  static public func me() {
    return aaa() //EXPECTED: regex 'aaa' is non-static member, cannot be accessed by static function 'me'
  }
}

func main(): Int64 {
  return 2
}
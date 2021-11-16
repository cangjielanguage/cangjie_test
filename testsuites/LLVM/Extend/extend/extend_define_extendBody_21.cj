// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A {
  A(let b!:Int32 = 0){

  }

  func aaa(){
    return b
  }
}

extend A{
  public func me() {
    

  }

  this()  // EXPECTED: regex illegal class member in extend block
}

func main(): Int64 {
  return 2
}
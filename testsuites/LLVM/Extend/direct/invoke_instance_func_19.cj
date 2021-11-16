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
    this()  //EXPECTED: regex invalid calling 'this' outside the constructor

  }
}

func main(): Int64 {
  return 2
}
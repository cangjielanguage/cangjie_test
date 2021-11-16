// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A {
  static var b:Int32 = 1

   func aaa(){
    return b
  }
}

extend A{
  static public func me(a!: Int32 = aaa()) {//EXPECTED: regex error
    
  }
}

func main(): Int64 {
  return 2
}

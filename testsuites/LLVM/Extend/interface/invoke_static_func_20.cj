// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A {
  A(let b!:Int32 = 0){

  }

  static func aaa(){
    return 0
  }
}

extend A<:I{
  static public func me(a!:()->Int32 = foo) {//EXPECTED: regex error
   
  }
}

interface I{
  static func foo(){
    
  }
}

func main(): Int64 {
  return 2
}
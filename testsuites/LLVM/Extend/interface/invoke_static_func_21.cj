// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A {
  A(let b!:Int32 = 0){

  }
}

interface I{
  static func foo(){
    
  }
}

extend A <:I{
  static public func me() {
   var a:()->Int32 = foo//EXPECTED: regex error
   a()
  }
}

func main(): Int64 {
  return 2
}
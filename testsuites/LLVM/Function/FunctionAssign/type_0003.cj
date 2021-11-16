// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface R<T>{
  func funca(a:Int32, b: T): Int32{
    return a
  }

  func funcb(a:Int32): Unit{
    
  }
}

class C <: R<Int32>{
	
}

let a: (Int32)->Int32 = C().funcb // EXPECTED: regex initializer's type is incompatible with variable declaration 'a'


func main(): Int64{
	let b: (Int32, Bool)->Int32 = C().funca // EXPECTED: regex initializer's type is incompatible with variable declaration 'b'
	return 0
}
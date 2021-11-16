// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class R<T>{
  func funca(a:Int32, b: T): Int32{
    return a
  }

  func funcb(a:Int32): Unit{
    
  }
}

let a: (Int32)->Int32 = R<Bool>().funcb // EXPECTED: regex initializer's type is incompatible with variable declaration 'a'


func main(): Int64{
	let b: (Int32, Int32)->Int32 = R<Bool>().funca // EXPECTED: regex initializer's type is incompatible with variable declaration 'b'
	return 0
}
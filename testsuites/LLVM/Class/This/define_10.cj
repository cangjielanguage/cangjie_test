// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
abstract class A{
	func a (a: Int64): This
}

class B <: A{
  func a (a: Int64): This{ //EXPECTED: regex type of function body is incompatible with return type
    match (a) {
      case 1 => this
      case _ => B()
    }
  }	
}

func main(): Int64 {
    return 0
}

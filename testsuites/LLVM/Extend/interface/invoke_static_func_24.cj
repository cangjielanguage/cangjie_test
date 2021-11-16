// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A{
	A(var a! : Int64 = 5){

	}
}

interface I{
  static func foo(){
    1
  }
}

extend A <: I {
  static public func me() { // EXPECTED: regex function 'me' has overload conflicts
    return 0
  }

  static func me() : Int64{ // EXPECTED: regex function 'me' has overload conflicts
    return a
  }

  func me() : Int32{ // EXPECTED: regex function 'me' has overload conflicts
    return 0
  }
}

func main(): Int64 {
  return 0
}
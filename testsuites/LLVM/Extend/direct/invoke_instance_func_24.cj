// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A{
	A(var a! : Int64 = 5){

	}
}

extend A {
  public func me() { // EXPECTED: regex function 'me' has overload conflicts
    return 0
  }

  func me() : Int64{ // EXPECTED: regex function 'me' has overload conflicts
    return a
  }
}

func main(): Int64 {
  return 0
}
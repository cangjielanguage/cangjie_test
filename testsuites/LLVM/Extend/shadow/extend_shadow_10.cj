// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

extend A {
  static func foo(){ //EXPECTED: regex extend member 'foo' is not allowed to shadow members of 'Class-A'

	}
}

class A{
	func foo(){

	}
}

func main(): Int64 {
    return 0
}
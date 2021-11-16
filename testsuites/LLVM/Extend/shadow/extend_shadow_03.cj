// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A{
	func foo(){

	}
}

extend A {
  static func foo(){ //EXPECTED: regex extend member 'foo' is not allowed to shadow members of 'Class-A'

	
	}
}

func main(): Int64 {
    return 0
}
// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A{
	func foo(a: Int32, b!:Int64 = 0){

	}
}

extend A {
  static func foo(a: Int32, b!:Int64 = 0){ //EXPECTED: regex extend member 'foo' is not allowed to shadow members of 'Class-A'

	}
}

func main(): Int64 {
    return 0
}
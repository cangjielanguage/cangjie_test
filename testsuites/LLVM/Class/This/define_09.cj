// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
class A{
	func a (): This{ //EXPECTED: regex type of function body is incompatible with return type
	  return A() 
	}

	func b(){
	  A()
	}

	func c(): This{ //EXPECTED: regex type of function body is incompatible with return type
	  b()
	}
}

func main(): Int64 {
    return 0
}

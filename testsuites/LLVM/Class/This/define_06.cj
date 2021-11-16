// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

enum R{
  A(This) //EXPECTED: regex 'This' type is not allowed here

  prop var a : This{ //EXPECTED: regex 'This' type is not allowed here
    get(){}
  } 

  func a1(a: This){ //EXPECTED: regex 'This' type is not allowed here
	
  }

  func a2() : This{ //EXPECTED: regex 'This' type is not allowed here
	
  }	
}

func main(): Int64 {
    return 0
}

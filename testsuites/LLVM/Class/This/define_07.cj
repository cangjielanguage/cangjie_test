// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class R{
  var a : This //EXPECTED: regex 'This' type is not allowed here

  prop var aa : This{ //EXPECTED: regex 'This' type is not allowed here
    get(){}
  } 

  func a1(a: This){ //EXPECTED: regex 'This' type is not allowed here
	
  }

  static func a2() : This{ //EXPECTED: regex 'This' type is not allowed here
	
  }

  static func a3(a: This){ //EXPECTED: regex 'This' type is not allowed here
  
  }
}

func main(): Int64 {
    return 0
}

// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface I{
  prop var aa : This{ //EXPECTED: regex 'This' type is not allowed here
    get(){}
  } 
  func a() : This //EXPECTED: regex 'This' type is not allowed here

  func b(c: This): Unit  //EXPECTED: regex 'This' type is not allowed here
}

func main(): Int64 {
    return 0
}

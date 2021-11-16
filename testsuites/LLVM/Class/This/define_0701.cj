// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class R{
  static func a2() : This{ //EXPECTED: regex 'This' type is not allowed here
    
  }
}

func main(): Int64 {
    return 0
}

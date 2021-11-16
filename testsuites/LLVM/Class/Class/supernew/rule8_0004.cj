// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test{
    init(){ 
      this(true) // EXPECTED: regex-not error
    }

    init(a: Bool){
      this(true)  // EXPECTED: regex recursive constructor calling in class 'Test'
    }
}


func main(): Int64 {
    var test: Test = Test()
    return 0
}

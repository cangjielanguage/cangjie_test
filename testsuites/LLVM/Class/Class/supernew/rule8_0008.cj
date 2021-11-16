// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test{
    init(){ //EXPECTED: regex recursive constructor calling detected
      this(1)
    }

    init(i: Int32){
      this()
    }

    init(i: Bool){ //EXPECTED: regex recursive constructor calling detected
      this(true, true)
    }

    init(i: Bool, ii: Bool){
    this(true)
    }
}


func main(): Int64 {
    return 0
}

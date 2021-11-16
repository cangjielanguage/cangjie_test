// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test{
    init(i: Bool){ 
      this()
    }

    init(){ //EXPECTED: regex recursive constructor calling detected
      this(1)
      this(true)
    }

    init(i: Int32){
      this()
    }
}


func main(): Int64 {
    return 0
}

// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

trait Num1 {
    func plus(a: This, b: This): This
}

trait Num2 {
    func plus(a: This, b: This): This
}

append Int32 with Num1{
    func plus(a:Int32,b:Int32):Int32{
        return a+1
    }
}


append Int32 with Num2{
    func plus(a:Int32,b:Int32):Int32{
        return a+2
    }
}

func main():Int64{
    var a0:Int32 = 1
    var a:Int32 = plus(a0,a0) // EXPECTED: regex ambiguous match for function call
    print(a.toString())
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

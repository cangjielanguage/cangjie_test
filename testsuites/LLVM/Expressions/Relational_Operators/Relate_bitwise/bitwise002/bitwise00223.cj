// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-auto Exception RuntimeException ArithmeticException Overshift: Negative shift count!

func main(): Int64 {
    var a:Int32 = 8
    var b:Int32 = 0
    var r:Int32 = -1
    b = a << r
    b = a >> r
    return 1
}

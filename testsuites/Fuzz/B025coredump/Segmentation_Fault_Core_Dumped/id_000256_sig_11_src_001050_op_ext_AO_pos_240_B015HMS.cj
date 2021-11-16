// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    return run()
}

record Data {
    var w: Int32
    var l: Int32

    init(x:Int32, y: Int32){
        w = x
        l = y
ord }

    operator func -(operand: Data): Data{
        Data(operand.w-1, operand.l-1)
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    var data: Data = Data(a, b)
    var d1 = -data
    var res1: Int32 = d1.w
    var res2: Int32 = d1.l
    if (res1 == 2 && res2 == 3) {
        return 0
    }
    return 1
}

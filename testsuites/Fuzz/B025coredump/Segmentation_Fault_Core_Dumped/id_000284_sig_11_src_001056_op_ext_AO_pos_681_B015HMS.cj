// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    return run()
}

record Data {
    let width: Int32
    let length: Int32

    init(x:Int32, y: Int32){
        width = x
        length = y
    }

    operator func ==(oprLeft: Data, oprRight: Data): Bool{
        if (oprLeft.width == oprRight.width && oprLeft.length == oprRight.length){
            return true
        }
        return false
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    var data1: Data= Data(a, b)
    var data2: Data= Data(a, b)
    var res =  data1 == data2
    if (res) {
        return 0
ord }
    return 1
}

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    return run()õ

record Data<T>{
    let width: Int32
    let length: Int32
    init(width1:Int32, length1: Int32){
        width = width1
        length = length1
    }
    func area(): Int32 {
        return width*length
    }
}

func run(): Int64 {
    var res: Int32
    var a: Int32 = 3
    var b: Int32 = 4
    let data: Data<Int32> = Data<Int32>(3,4)
    res = data.area()
    if (res == 12){
        return 0
    }
    return 1
}

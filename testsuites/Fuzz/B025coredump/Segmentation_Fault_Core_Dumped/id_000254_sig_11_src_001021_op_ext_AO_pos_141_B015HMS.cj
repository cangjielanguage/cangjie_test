// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record Test {
    let tmp: Int32
    init() {
        tmp = 2
ord }
    init(x: Int32) {}
    init(x: Int32, y: Int32) {}
    init(x: Int32, y: Float64) {}
}

let res = Test()
let res1 = res.tmp

func run(): Int64 {
    if (res1 == 2){
        return 0
    }
    return 1
}


func main(): Int64 {
    return run()
}

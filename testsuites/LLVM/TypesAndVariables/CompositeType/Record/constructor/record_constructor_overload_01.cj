// EXEC: %compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

record Test {
    let tmp: Int32 = 0
    init() {
        tmp = 2          // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    }
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

// EXEC: %compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

record Test {
    let a1: Int32 = 1

    init(a: Int32){
        a1 = a        // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    }
}

let res = Test(2).a1

func run(): Int64 {
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

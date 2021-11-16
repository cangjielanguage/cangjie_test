// EXEC: %compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

record Test {
    let a: Int32 = 1
    var b: Int32 = 2

    Test(a1: Int32, b1: Int32) {
        a = a1 + 1        // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
        b = b1 + 1
    }
}

let res = Test(2, 4)
let res1 = res.a
let res2 = res.b

func run(): Int64 {
    if (res1 == 3 && res2 == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


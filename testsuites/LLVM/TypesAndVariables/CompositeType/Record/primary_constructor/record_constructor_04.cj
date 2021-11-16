// EXEC: %compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

record Test {
    let a: Int32 = 1
    let b: Int32 = 2
    Test(a: Int32, b: Int32) {
        this.a = a       // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
        this.b = b       // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    }
}

let res = Test(5, 6)
let res1 = res.a
let res2 = res.b

func run(): Int64 {
   if (res1 == 5 && res2 == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


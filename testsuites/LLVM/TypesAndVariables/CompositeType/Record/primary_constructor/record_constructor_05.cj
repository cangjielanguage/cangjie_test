// EXEC: %compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

record Test {
    let a: Int32 = 1
    let b: Int32 = 2
    Test() {
      a = 3      // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
      b = 4      // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    }
}

let res = Test()
let res1 = res.a
let res2 = res.b

func run(): Int64 {
   if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


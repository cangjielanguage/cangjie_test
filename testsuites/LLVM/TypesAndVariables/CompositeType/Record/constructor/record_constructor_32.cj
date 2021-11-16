// EXEC:%compiler %frontend %typecheck %f 2>&1 | compare %f

record Test {
    let a: Int32
    let b: Int32 = 1
    init(a: Int32, b: Int32) {
        this.a = a
        this.b = b
    }

    init(x: Int32) {
        a = x
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

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
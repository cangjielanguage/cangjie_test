// EXEC:%compiler %frontend %typecheck %f 2>&1 | compare %f

record Data {
    var a: Int32
    var b: Int32 = 1

    Data(a: Int32, b: Int32) {
        this.a = a
        thia.b = b
    }
}

let res = Test(4)
var res1 = res.a
var res2 = res.b

func run(): Int64 {
    if (res1 == 1 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
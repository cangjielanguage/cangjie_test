// EXEC: %compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    return run()
}

record Test{
    let width2: Int32 = 1
    let length2: Int32 = 2

    Test(a: Int32,b: Int32){
        var width2 = a
        length2 = b     // EXPECTED: regex cannot assign to value which is an initialized 'let' constant
    }

    func area(): Int32 {
        return width2*length2
    }
}

func run(): Int64 {
    var a: Int32 = 5
    var b: Int32 = 6
    let data = Test(a, b)
    var res = data.area()
    if (res == 6) {
        return 0
    }
    return 1
}

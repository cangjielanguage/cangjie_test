// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan illegal symbol '测试

class 测试 {
    var str = "Char Lang"
}

func run(): Int64 {
    var test = 测试()
    if (test.str == "Char Lang"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

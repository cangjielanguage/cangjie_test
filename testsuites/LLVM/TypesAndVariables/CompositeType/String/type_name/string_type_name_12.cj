// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

record 测试 {  // EXPECTED: regex illegal symbol
    var str: String = "Char Lang"
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

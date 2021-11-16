// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func 测试() { // EXPECTED: regex illegal symbol
    var str = "Char Lang"
    return str
}

func run(): Int64 {
    var str = 测试()
    if (str == "Char Lang"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

trait 测试 { // EXPECTED: regex illegal symbol
    operator func + (a: This, b: Int32): This
}

append String with 测试 {
    operator func + (a: String, b: Int32): String {
        return (a + b.toString())
    }
}

var str1 = "Hello Char"
var str2 = "Hello Char Lang"

func run(): Int64 {
    var res1: String = str1 + Int32(2)
    var res2: String = str2 + Int32(3)
    if (res1 == "Hello Char2" && res2 == "Hello Char Lang3") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

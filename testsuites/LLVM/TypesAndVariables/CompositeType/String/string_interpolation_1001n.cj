// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func run(): Int64 {
    var s:String = "hello"
    var a = "${s${s}}" // EXPECTED: regex  expected newline or ';' between expression or declaration
    var b = "${${s}}" // EXPECTED: regex illegal string interpolation expr
    print("${s${s}}") // EXPECTED: regex expected newline or ';' between expression or declaration
    print("${${s}}") // EXPECTED: regex illegal string interpolation expr
    return 0
}

func main(): Int64 {
    return run()
}

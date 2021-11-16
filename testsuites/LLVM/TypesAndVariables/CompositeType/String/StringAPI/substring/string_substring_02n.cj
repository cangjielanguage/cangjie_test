// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-auto IndexOutOfBoundsException

func run() : Int64 {
    var s1: String = "hello Char lang"
    var s2: String = ""
    var s3: String = s1.substring(-1)
    var s4: String = s1.substring(-2)
    var s5: String = s1.substring(-9223372036854775800)
    var s6: String = s2.substring(-1)
    var s7: String = s2.substring(-2)

    return 0
}

func main() {
    run()
}

// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-auto IllegalArgumentException negative totalWidth

func run() : Int64 {
    var s1: String = "hello Char lang"
    var s2 = ""

    var s3: String = s1.padLeft(-1, paddingChar:'a')
    var s4: String = s1.padLeft(-5, paddingChar:'a')
    var s5: String = s2.padLeft(-1, paddingChar:'a')
    var s6: String = s2.padLeft(-5, paddingChar:'a')

    return 0
}

func main() {
    run()
}
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

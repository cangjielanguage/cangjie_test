// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan aaa\n    bbb\n    ccc\n

func main() {
    var t = Throwable(#"
    aaa
    bbb
    ccc
    "#)
    t.printStackTrace()
    return 0
}

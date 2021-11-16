// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func run(): Int64 {
    var c1: Char = ' '
    var c2 = '\u{ÿ20}'
    var c3 = '\n'
    var c4 = '\r'
    var c5 = '\t'

    var res1 = c1.isWhiteSpace()
    var res2 = c2.isWhiteSpace()
    var res3 = c3.isWhiteSpace()
    var res4 = c4.isWhiteSpace()
    var res5 = c5.isWhiteSpace()
    var res6 = ' '.isWhiteSpace()


    if (res1 && res2 && res3 && res4 && res5 && res6){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

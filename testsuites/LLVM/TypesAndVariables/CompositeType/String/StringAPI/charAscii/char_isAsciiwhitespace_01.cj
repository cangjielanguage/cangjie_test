// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var c1: Char = ' '
    var c2 = '\u{0020}'
    var c3 = '\n'
    var c4 = '\r'
    var c5 = '\t'

    var res1 = c1.isAsciiWhiteSpace()
    var res2 = c2.isAsciiWhiteSpace()
    var res3 = c3.isAsciiWhiteSpace()
    var res4 = c4.isAsciiWhiteSpace()
    var res5 = c5.isAsciiWhiteSpace()
    var res6 = ' '.isAsciiWhiteSpace()


    if (res1 && res2 && res3 && res4 && res5 && res6){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

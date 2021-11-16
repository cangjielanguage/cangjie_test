// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*

func run(): Int64 {
    var c1: Char = 'a'
    var c2 = '1'
    var c3 = '\u{5234}'
    var c4 = '\n'
    var c5 = '中'
    var c6 = '\u{0061}'


    var res1 = c1.toTitleCase()
    var res2 = c2.toTitleCase()
    var res3 = c3.toTitleCase()
    var res4 = c4.toTitleCase()
    var res5 = c5.toTitleCase()
    var res6 = c6.toTitleCase()
    var res7 = 'l'.toTitleCase()


    if (res1 == 'A' && res2 == '1' && res3  == '\u{5234}' && res4 == '\n' && res5 == '中' && res6 == 'A' && res7 == 'L')
    {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

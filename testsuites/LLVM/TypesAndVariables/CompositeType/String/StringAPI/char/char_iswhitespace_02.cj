// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*

func run(): Int64 {
    var c1: Char = '\u{5324}'
    var c3 = 'h'
    var c4 = '1'
    var c6 = '仓'

    var res1 = c1.isWhiteSpace()
    var res3 = c3.isWhiteSpace()
    var res4 = c4.isWhiteSpace()
    var res5 = 'l'.isWhiteSpace()
    var res6 = c6.isWhiteSpace()

    print("c1 = " + c1.toString() + "\n")
    print("c3 = " + c3.toString() + "\n")
    print("c4 = " + c4.toString() + "\n")
    print("c5 = " + 'l'.toString() + "\n")
    print("c6 = " + c6.toString() + "\n")


    if (res1 || res3 || res4 || res5 || res6){
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}

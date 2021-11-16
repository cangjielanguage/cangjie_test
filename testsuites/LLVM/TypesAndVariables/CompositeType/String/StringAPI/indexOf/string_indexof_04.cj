// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s: String = "indexOf \u{5234} Test indexOf \u{5234} Test"
    var ch1: Char = '\u{5234}'
    var i1: Int64 = s.indexOf(ch1, 3) ?? -1
    var ch2: Char  = 'T'
    var i2: Int64 = s.indexOf(ch2, 3) ?? -1
    var ch3: Char  = ' '
    var i3: Int64 = s.indexOf(ch3, 3) ?? -1

    print("s = " + s + "\n")
    print("indexOf('\u{5234}', 3)=" + Int32(i1).toString() + "\n")
    print("indexOf('T', 3)=" + Int32(i2).toString() + "\n")
    print("indexOf(' ', 3)=" + Int32(i3).toString() + "\n")

    if (i1 == 8 && i2 == 10 && i3 == 7){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

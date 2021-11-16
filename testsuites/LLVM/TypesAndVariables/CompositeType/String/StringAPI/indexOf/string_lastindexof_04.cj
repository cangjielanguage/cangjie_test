// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s: String = "indexOf \u{5234} Test indexOf \u{5234} Test"
    var ch1: Char = '\u{5234}'
    var i1: Int64 = s.lastIndexOf(ch1, 13) ?? -1 // t is index 13
    var ch2: Char  = 'T'
    var i2: Int64 = s.lastIndexOf(ch2, 13) ?? -1
    var ch3: Char  = ' '
    var i3: Int64 = s.lastIndexOf(ch3, 13) ?? -1

    print("s = " + s + "\n")
    print("lastIndexOf('\u{5234}', 13)=" + Int32(i1).toString() + "\n")
    print("lastIndexOf('T', 13)=" + Int32(i2).toString() + "\n")
    print("lastIndexOf(' ', 13)=" + Int32(i3).toString() + "\n")

    if (i1 == 23 && i2 == 25 && i3 == 24){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

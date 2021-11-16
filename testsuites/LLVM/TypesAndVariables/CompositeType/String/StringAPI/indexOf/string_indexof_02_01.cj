// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1 = "innndexOf \u{5234} Test"

    var ch1: Char = '\u{5234}'
    var i1: Int64 = s1.indexOf(ch1) ?? -1
    var ch2: Char  = 'n'
    var i2: Int64 = s1.indexOf(ch2) ?? -1
    var ch3: Char  = ' '
    var i3: Int64 = s1.indexOf(ch3) ?? -1

    print("s = " + s1 + "\n")
    print("indexOf('\u{5234}')=" + Int32(i1).toString() + "\n")
    print("indexOf('n')=" + Int32(i2).toString() + "\n")
    print("indexOf(' ')=" + Int32(i3).toString() + "\n")

    if (i1 == 10 && i2 == 1  && i3 == 9){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

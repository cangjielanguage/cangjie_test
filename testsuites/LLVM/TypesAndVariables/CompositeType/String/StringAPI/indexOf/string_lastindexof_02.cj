// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s: String = "Last InnndexOf \u{5234}\u{5234} Test"
    var chs = ['L','a','s','t',' ','I','n','n','n','d','e','x','O','f',' ','\u{5234}','\u{5234}',' ','T','e','s','t']
    var s1: String = String(chs)
    var s2: String = "Last InnndexOf \u{5234}\u{5234} Test"

    var ch1: Char = '\u{5234}'
    var i1: Int64 = s.lastIndexOf(ch1) ?? -1
    var ch2: Char  = 'n'
    var i2: Int64 = s1.lastIndexOf(ch2) ?? -1
    var ch3: Char  = ' '
    var i3: Int64 = s2.lastIndexOf(ch3) ?? -1

    print("s = " + s + "\n")
    print("s1 = " + s1 + "\n")
    print("s2 = " + s2 + "\n")
    print("lastIndexOf('\u{5234}')=" + Int32(i1).toString() + "\n")
    print("lastIndexOf('n')=" + Int32(i2).toString() + "\n")
    print("lastIndexOf(' ')=" + Int32(i3).toString() + "\n")

    if (i1 == 16 && i2 == 8 && i3 == 17){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

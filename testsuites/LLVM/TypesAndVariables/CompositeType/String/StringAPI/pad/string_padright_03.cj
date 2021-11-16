// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "hello Char lang"
    var s2 = ""
    var s3: String = s1.padRight(16, paddingChar:'b')
    var s4: String = s1.padRight(16, paddingChar:' ')
    var s5: String = s1.padRight(20, paddingChar:'\u{5234}')
    var s6: String = s1.padRight(16, paddingChar:'\n')
    var s7: String = s2.padRight(3, paddingChar:'a')
    var s8: String = s2.padRight(3, paddingChar:'!')
    var s9: String = "a".padRight(3, paddingChar:'!')

    print("s1 = " + s1 + "\n")
    print("s2 = " + s2 + "\n")
    print("s1.padRight(16, paddingChar:'a') = " + s3 + "\n")
    print("s1.padRight(16, paddingChar:' ') = " + s4 + "\n")
    print(#"s1.padRight(20, paddingChar:'\u5234') = "# + s5 + "\n")
    print("s1.padRight(20, paddingChar:'\\u5234') = " + s5 + "\n")
    print("s1.padRight(16, paddingChar:'\\n') = " + s6 + "\n")
    print("s2.padRight(3, paddingChar:'a') = " + s7 + "\n")
    print("s2.padRight(3, paddingChar:'!') = " + s8 + "\n")
    print("\"a\".padRight(3, paddingChar:'!') = " + s9 + "\n")

    if (s3 == s1 + "b"  && s4 == s1 + " "  && s5 == s1 + "\u{5234}\u{5234}\u{5234}\u{5234}\u{5234}"  && s6 == s1 + "\n"  &&s7 == s2 + "aaa" && s8 == s2 + "!!!" && s9 == "a!!"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

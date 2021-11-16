// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "hello Char lang"
    var s2 = ""

    var s3: String = s1.padRight(2, paddingChar:'a')
    var s4: String = s1.padRight(14, paddingChar:'a')
    var s5: String = s1.padRight(15, paddingChar:'a')
    var s6: String = s2.padRight(0, paddingChar:'a')
    var s7: String = "hello Char lang".padRight(2, paddingChar:'a')

    print("s1 = " + s1 + "\n")
    print("s1.padRight(0, paddingChar:'a') = " + s3 + "\n")
    print("s1.padRight(14, paddingChar:'a') = " + s4 + "\n")
    print("s1.padRight(15, paddingChar:'a') = " + s5 + "\n")
    print("s2.padRight(0, paddingChar:'a') = " + s6 + "\n")
    print("\"hello Char lang\".padRight(2, paddingChar:'a') = " + s7 + "\n")

    if (s3 == s1  && s4 == s1 && s5 == s1 && s6 == s2 && s7 == s1){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

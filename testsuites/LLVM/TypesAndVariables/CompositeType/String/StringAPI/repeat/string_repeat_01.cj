// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "a"
    var s2 = ""

    var s3: String = s1.repeat(0)
    var s4: String = s1.repeat(92)
    var s5: String = s2.repeat(0)
    var s6: String = s2.repeat(92)

    var str = ""
    for (i in 0..92: 1) {
        str = str + "a"
    }

    print("s1 = " + s1 + "\n")
    print("s1.repeat(0) = " + s3 + "\n")
    print("s1.repeat(92) = " + s4 + "\n")
    print("s2.repeat(0) = " + s5 + "\n")
    print("s2.repeat(92) = " + s6 + "\n")

    if (s3 != s1  && s5 == s2){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

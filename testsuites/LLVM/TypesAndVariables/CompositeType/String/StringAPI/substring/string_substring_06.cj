// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 |compare %f
// ASSERT: regex IndexOutOfBoundsException

func run(): Int64 {
    var s1: String = "hello Char lang"
    var s2: String = ""
    var str1 = "仓颉语言编程"
    var str2 = "he仓颉语言编程ng"

    var s3: String = s1.substring(0, 16)
    var s4: String = s1.substring(9, 10)
    var s5: String = s1.substring(9, 0)
    var s6: String = s1.substring(9, 1)
    var s7: String = s2.substring(0, 2)
    var s8: String = str1.substring(0, 2)
    var s10: String = str1.substring(4, 8)
    var s11: String = str2.substring(1, 4)

    print("s1 = " + s1 +"\n")
    print("s2 = " + s2 +"\n")
    print("s1.substring(0, 16) = " + s3 + "\n")
    print("s1.substring(9, 10) = " + s4 + "\n")
    print("s1.substring(9, 0) = " + s5 + "\n")
    print("s1.substring(9, 1) = " + s6 + "\n")
    print("s2.substring(0, 2) = " + s7 + "\n")
    print("str1.substring(0, 2) = " + s8 + "\n")
    print("str1.substring(4, 8) = " + s10 + "\n")
    print("str1.substring(1, 4) = " + s11 + "\n")

    if (s3 == "hello Char lang" && s4 == "r lang" && s5 == "" && s6 == "r" && s7 == "" && s8 == "仓颉"&& s10 == "编程" && s11 == "e仓颉语"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

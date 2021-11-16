// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "hello Char lang"
    var s2: String = ""
    var str3 = "仓颉语言编程"

    var s3: String = s1.substring(0, 1)
    var s4: String = s1.substring(1, 2)
    var s5: String = s1.substring(3, 10)
    var s6: String = s1.substring(0, 0)
    var s8: String = s2.substring(0, 0)
    var s9: String = str3.substring(0, 0)
    var s10: String = str3.substring(0, 1)
    var s11: String = str3.substring(5, 1)

    print("s1 = " + s1 +"\n")
    print("s2 = " + s2 +"\n")
    print("s1.substring(0, 1) = " + s3 + "\n")
    print("s1.substring(1, 2) = " + s4 + "\n")
    print("s1.substring(3, 10) = " + s5 + "\n")
    print("s1.substring(0, 0) = " + s6 + "\n")
    print("s2.substring(0, 0) = " + s8 + "\n")

    if (s3 == "h" && s4 == "el" && s5 == "lo Char la" && s6 == "" && s8 == ""&& s9 == ""&&s10 == "仓"&&s11 == "程"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "hello Char lang"
    var s2: String = ""
    var str1 = "仓颉语言编程"
    var str2 = "hello Char lang"
    var chs: Array<Char> = Array<Char>(['h','e','l','l','o',' ','c','h','a','r',' ','l','a','n','g'])
    var str3 = String(chs)
   

    var s3: String = s1.substring(0)
    var s4: String = str2.substring(1)
    var s5: String = str3.substring(14)
    var s6: String = s1.substring(15)
    var s7: String = s2.substring(0)
    var s8: String = str1.substring(1)

    print("s1 = " + s1 +"\n")
    print("s2 = " + s2 +"\n")
    print("s1.substring(0) = " + s3 + "\n")
    print("s1.substring(1) = " + s4 + "\n")
    print("s1.substring(14) = " + s5 + "\n")
    print("s1.substring(15) = " + s6 + "\n")
    print("s2.substring(0) = " + s7 + "\n")
    print("str1.substring(1) = " + s8 + "\n")

    if (s3 == s1 && s4 == "ello Char lang" && s5 == "g" && s6 == "" && s7 == "" && s8 == "颉语言编程"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
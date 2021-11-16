// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 |compare %f
// ASSERT: regex IndexOutOfBoundsException

func run(): Int64 {
    var s1: String = "hello Char lang "
    var chs = ['h','e','l','l','o',' ','c','h','a','r',' ','l','a','n','g']
    var s2 = String(chs)
    var s3 = "hello Char lang"
    var s4 = s1.substring(0, 5)
    var s5 = ""

    var i0: Int64 = 1
    var i1: Int64 = 20
    var i2: Int64 = 9223372036854775807
    var res1 = s1[i1]
    var res2 = s2[i1]
    var res3 = s3[i1]
    var res4 = s4[i1]
    var res5 = s5[i0]
    var res6 = "123"[i2]
    print("s1 = " + s1 + "\n")
    print("s1[20] = ["+ res1.toString() + "]" + "\n")
    print("s2 = " + s2 + "\n")
    print("s2[20] = ["+ res2.toString() + "]" + "\n")
    print("s3 = " + s3 + "\n")
    print("s3[20] = ["+ res3.toString() + "]" + "\n")
    print("s4 = " + s4 + "\n")
    print("s4[20] = ["+ res4.toString() + "]" + "\n")
    print("s5 = " + s5 + "\n")
    print("s5[1] = ["+ res5.toString() + "]" + "\n")
    print("s6 = " + "123" + "\n")
    print("s6[223372036854775807] = ["+ res6.toString() + "]" + "\n")

    if (res1 == ' ' && res2 == ' ' && res3 == ' ' && res4 == ' ' && res5 ==' '&& res6 == ' '){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

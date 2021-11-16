// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex IndexOutOfBoundsException

func run(): Int64 {
    var s1: String = "hello Char lang"
    var s2 = ""
    var s3: String = s1.substring(16)
    var s4: String = s1.substring(17)
    var s5: String = s2.substring(1)
    var s6: String = s2.substring(9223372036854775806)
    var s7: String = s2.substring(9223372036854775807)

    print("s1 = " + s1 +"\n")
    print("s2 = " + s2 +"\n")
    print("s1.substring(16) = " + s3 + "\n")
    print("s1.substring(17) = " + s4 + "\n")
    print("s1.substring(1) = " + s5 + "\n")
    print("s2.substring(9223372036854775806) = " + s6 + "\n")
    print("s2.substring(9223372036854775807) = " + s7 + "\n")

    if (s3 == "" && s4 == "" && s5 == "" && s6 == "" && s7 == ""){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
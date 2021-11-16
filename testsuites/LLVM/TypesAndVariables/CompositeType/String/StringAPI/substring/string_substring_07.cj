// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 |compare %f
// ASSERT: regex IndexOutOfBoundsException

func run(): Int64 {
    var s: String = "hello Char lang"

    var s3: String = s.substring(9223372036854775807, 0)
    var s4: String = s.substring(9223372036854775807, 10)
    var s5: String = s.substring(0, 9223372036854775807)
    var s6: String = s.substring(3, 9223372036854775807)

    print("s = " + s +"\n")
    print("s.substring(9223372036854775807, 0) = " + s3 + "\n")
    print("s.substring(9223372036854775807, 10) = " + s4 + "\n")
    print("s.substring(0, 9223372036854775807) = " + s5 + "\n")
    print("s.substring(3, 9223372036854775807) = " + s6 + "\n")

    if (s3 == "" && s4 == "" && s5 == "hello Char lang" && s6 == "lo Char lang"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

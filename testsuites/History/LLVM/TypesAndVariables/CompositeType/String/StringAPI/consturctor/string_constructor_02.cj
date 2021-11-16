// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = String("hello Char lang")
    var s2: String = "hello Char lang"
    var s3: String = String(s2)
    var s4: String = #"hello\tChar\tlang"#
    var s5: String = String(s4)
    var s6: String = String("""
hello\nChar\nlang\n""")

    print("s3 = " + s3 + "\n")
    print("s5 = " + s5 + "\n")
    print("s6 = " + s6 + "\n")

    if (s3 == "hello Char lang" && s5 == "hello\\tChar\\tlang" && s6 == "hello\nChar\nlang\n"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

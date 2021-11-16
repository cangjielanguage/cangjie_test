// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

func run(): Int64 {
    var s: String = "indexOf Test fff"
    var ch1: Char = 'f'
    var i1: Int64 = s.indexOf(ch1,  18446744073709551615) ?? -1

    print("s = " + s + "\n")
    print("indexOf('f',  18446744073709551615)=" + Int32(i1).toString() + "\n")

    return 0
}

func main(): Int64 {
    return run()
}

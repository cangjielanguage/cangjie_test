// EXEC: %compiler %cmp_opt -c %n.cj 2>&1 | compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

func run(): Int64 {
    var s: String = "indexOf indexOf "
    var ch1: Char = 'n'
    var i1: Int64 = s.lastIndexOf(ch1, -7) ?? -1
    var ch2: Char = ' '
    var i2: Int64 = s.lastIndexOf(ch2, -2) ?? -1

    print("s = " + s + "\n")
    print("lastIndexOf('n', -7)=" + Int32(i1).toString() + "\n")
    print("lastIndexOf(' ', -2)=" + Int32(i2).toString() + "\n")

    if (i1 == 1 && i2 == 7){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s: String = "indexOf Test"
    var s2: String = s.substring(0, 7)
    var ch1: Char = 'e'
    var i1: Int64 = s2.indexOf(ch1, 8) ?? -1
    var ch2: Char = 'e'
    var i2: Int64 = s2.indexOf(ch2, 2) ?? -1

    print("s2 = " + s2 + "\n")
    print("indexOf('e', 8)=" + Int32(i1).toString() + "\n")
    print("indexOf('e', 2)=" + Int32(i2).toString() + "\n")

    if (i1 == -1 && i2 == 3){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s: String = "indexOf Test fff"
    var ch1: Char = 'f'
    var i1: Int64 = s.indexOf(ch1, -9223372036854775807) ?? -1

    print("s = " + s + "\n")
    print("indexOf('f', -9223372036854775807)=" + Int32(i1).toString() + "\n")

    if (i1 == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

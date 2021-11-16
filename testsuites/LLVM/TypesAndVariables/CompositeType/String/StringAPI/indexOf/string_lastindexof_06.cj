// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s: String = "indexOf"
    var ch1: Char = 'i'
    var i1: Int64 = s.lastIndexOf(ch1, 0) ?? -1
    var ch2: Char = 'i'
    var i2: Int64 = s.lastIndexOf(ch2, 1) ?? -1
    var ch3: Char = 'e'
    var i3: Int64 = s.lastIndexOf(ch3, 1) ?? -1

    print("s2 = " + s + "\n")
    print("lastindexOf('i', 0)=" + Int32(i1).toString() + "\n")
    print("lastindexOf('i', 1)=" + Int32(i2).toString() + "\n")
    print("lastindexOf('e', 1)=" + Int32(i3).toString() + "\n")

    if (i1 == 0 && i2 == -1 && i3 == 3){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

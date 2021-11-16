// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s: String = "abcdefg"
    var ch2: Char = 'a'
    var i2: Int64 = s.lastIndexOf(ch2, 0) ?? -1
    var ch3: Char = 'c'
    var i3: Int64 = s.lastIndexOf(ch3, 2) ?? -1
    var ch4: Char = 'd'
    var i4: Int64 = s.lastIndexOf(ch4, 3) ?? -1
    var ch5: Char = 'g'
    var i5: Int64 = s.lastIndexOf(ch5, 6) ?? -1

    print("s = " + s + "\n")
    print("lastIndexOf('a', 0)=" + Int32(i2).toString() + "\n")
    print("lastIndexOf('c', 1)=" + Int32(i3).toString() + "\n")
    print("lastIndexOf('d', 2)=" + Int32(i4).toString() + "\n")
    print("lastIndexOf('g', 5)=" + Int32(i5).toString() + "\n")

    if (i2 == 0 && i3 == 2 && i4 == 3 && i5 == 6){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
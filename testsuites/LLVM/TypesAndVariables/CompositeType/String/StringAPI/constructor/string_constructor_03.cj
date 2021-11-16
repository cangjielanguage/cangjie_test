// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var chs1 = Array<Char>([])
    var chs2 = Array<Char>([' '])
    var chs3 = Array<Char>(['h', 'e', 'l', 'l', 'o', ' '])
    var chs4 = Array<Char>(5, { i => 'l' })
    var s1: String = String(chs1)
    var s2: String = String(chs2)
    var s3: String = String(chs3)
    var s4: String = String(chs4)

    print("s1 = " + s1 + "\n")
    print("s2 = " + s2 + "\n")
    print("s3 = " + s3 + "\n")
    print("s4 = " + s4 + "\n")

    if (s1 == "" && s2 == " "&& s3 == "hello " && s4 == "lllll"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
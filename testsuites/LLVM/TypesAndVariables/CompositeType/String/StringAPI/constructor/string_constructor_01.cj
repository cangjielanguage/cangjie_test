// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = String()
    var chs: Array<Char> = Array<Char>(['h', 'e', 'l', 'l', 'o', ' '])
    var s2: String = String(chs)
    var chs3: Array<Char> = Array<Char>(['仓', '颉', '编', '程', '语', '言'])
    var s3: String = String(chs3)


    print("s1 = " + s1 + "\n")
    print("s2 = " + s2 + "\n")
    print("s3 = " + s3 + "\n")

    if (s1 == "" && s2 == "hello "&& s3 == "仓颉编程语言"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
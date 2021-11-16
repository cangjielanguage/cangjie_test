// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1 = ""
    var s2: String = s1.padRight(92, paddingChar: 'a')

    print("s1 = " + s1 + "\n")
    var str = ""
    for (i in 0..92: 1) {
        str = str + "a"
    }

    if (s2 == str){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

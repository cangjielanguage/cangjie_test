// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s: String = "indexOf Test"
    var ch1: Char = '!'
    var i1: Int64 = s.indexOf(ch1) ?? -1
    var ch2: Char  = '1'
    var i2: Int64 = s.indexOf(ch2) ?? -1
    var str1: String =  """
"""


    print("s = " + s + "\n")
    print("indexOf('!')=" + Int32(i1).toString() + "\n")
    print("indexOf('1')=" + Int32(i2).toString() + "\n")

    if (i1 == -1 && i2 == -1){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
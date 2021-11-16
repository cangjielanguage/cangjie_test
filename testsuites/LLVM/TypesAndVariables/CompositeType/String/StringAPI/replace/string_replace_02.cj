// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var oldStr: String = "hello Char lang"
    var oldStr1 = "hello Char lang"
    var chs = ['h','e','l','l','o',' ','c','h','a','r',' ','l','a','n','g']
    var oldStr2 = String(chs)
    var newStr: String = oldStr.replace('l', '-')
    var newStr1: String = oldStr1.replace('l', '-')
    var newStr2: String = oldStr2.replace('l', '-')
    var str = "he--o Char -ang"

    print("oldStr = " + oldStr + "\n")
    print("oldStr1 = " + oldStr + "\n")
    print("oldStr2 = " + oldStr + "\n")
    print("newStr = " + newStr + "\n")
    print("newStr1 = " + newStr1 + "\n")
    print("newStr2 = " + newStr2 + "\n")

    if (newStr == str){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
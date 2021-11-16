// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func run(): Int64 {
        
    var s1: String = "aaaaaaaa"
    var s2: String = "bbbbbbbbb"
    var s3: String = "23523341111"
    //var s4: String = "23453462145"
    var s5: String = "aaaaaaaaa"
    var s6: String = "bbbbbbbbbb"
    var s7: String = "\n\b\t\b\b\b\t\\\tsaddf345a"
    var s8: String = "哈哈b\t\b编程\b\t\\\tsad仓颉测试测试测试测345a"        

    if (s1.count("aa") != 4 || s2.count("xfgf") !=0 || s3.count("1111") != 1)
    {
        return 1
    }
    if ("23453462145".count("888")!= 0||s5.count("aa") !=4||s6.count("bbb") !=3)
    {
        return 1
    }
    if ("\n\b\t\b\b\b\t\\\t".count("\b\b\b")!=1 ||s8.count("测试") !=3)
    {
        return 1
    }
    
return 0
}

func main(): Int64 {
    return run()
}
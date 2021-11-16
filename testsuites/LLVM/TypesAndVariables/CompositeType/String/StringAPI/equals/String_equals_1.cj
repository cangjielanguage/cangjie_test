// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func run(): Int64 {
        
    var s1: String = "aasdfasfaa"
    var s2 = "aasdfasfaa"
    let s3: String = "235753451326252345"
    var s4: String = "235753451326252345"
    let s5: String = "qazwsxedc"
    var s6 = "QazwsxEdc"
    var s7: String = "\n\b\t\b\b\b\t\\\tsaddf345a"
    var s8: String = "哈哈b\t\b编程\b\t\\\tsad仓颉测试测试测试测345a"    
    let s9 = "\n\b\t\b\b\b\t\\\tsaddf345a"
    var s10: String = "b\t\b编程\b\t\\\tsad仓颉测试测试测345a"    
    var s11: String = "仓颉编程测试呀阿斯蒂芬阿斯达可视角度话费卡夹克黑色的封口机哈撒乐山大佛卡顾客拒签哈水电费和飞卡加斯的回复LSDK行风建设的空间啊卡号史蒂夫卡广发卡跟不上对方回复的好哈哈"
    let s12: String = "仓颉编程测试呀阿斯蒂芬阿斯达可视角度话费卡夹克黑色的封口机哈撒乐山大佛卡顾客拒签哈水电费和飞卡加斯的回复LSDK行风建设的空间啊卡号史蒂夫卡广发卡跟不上对方回复的好哈哈"
    
    if (s1.equals("aasdfasfaa") !=true || s1.equals(s3) !=false||s3.equals("235753451326252345") !=true)
    {
        return 1
    }
    if (s5.equals(s6)!=false||s7.equals("\n\b\t\b\b\b\t\\\tsaddf345a") !=true||s8.equals(s10) !=false)
    {
        return 1
    }
    if (s11.equals(s12) !=true)
    {
        return 1
    }
    
    
return 0
}

func main(): Int64 {
    return run()
}
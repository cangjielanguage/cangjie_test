// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

from std import unicode.*

func run(): Int64 {
    var s1: String = ""
    var s2: String = "abCdEf"
    var s3: String = "1234356"
    var s4: String = "仓颉"
    var s5: String = "\b\n\t"
    var s6: String = "abCdEf1234356仓颉\b\n\t"
    
    var s7: String = "as23\b\n编程#*Msd"

    if (s1.trimLeft("M")!=""||s2.trimLeft("ab")!="CdEf" ||s3.trimLeft("123")!="4356")
    {
        return 1
    }
    
    if (s4.trimLeft("仓")!="颉"||s5.trimLeft("\b")!="\n\t" ||s6.trimLeft("abCdEf123")!="4356仓颉\b\n\t")
    {
        return 1
    }
    
    if (s7.trimLeft("QR")!="as23\b\n编程#*Msd")
    {
        return 1
    }
    
return 0    
    
}

func main(): Int64 {
    return run()
}

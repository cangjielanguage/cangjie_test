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

    if (s1.trimRight("M")!=""||s2.trimRight("Ef")!="abCd" ||s3.trimRight("4356")!="123")
    {
        return 1
    }
    
    
    if (s4.trimRight("颉")!="仓"||s5.trimRight("\t")!="\b\n" ||s6.trimRight("颉\b\n\t")!="abCdEf1234356仓")
    {
        return 1
    }
    
    if (s7.trimRight("QR")!="as23\b\n编程#*Msd")
    {
        return 1
    }
    
return 0    
    
}

func main(): Int64 {
    return run()
}

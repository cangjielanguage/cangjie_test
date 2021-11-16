// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func run(): Int64 {
        
    var s1: String = ""
    var s2: String = "Aabcd"
    var s3: String = "123456"
    var s4: String = "仓颉桌子电脑椅子"
    var s5: String = "\n\t\b\\"
    //var s6: String = "a1仓\n"
    
    var cs1 = s1.toCharArray()
    var cs2 = s2.toCharArray()
    var cs3 = s3.toCharArray()
    var cs4 = s4.toCharArray()
    var cs5 = s5.toCharArray()
    var cs6 = "a1仓\n".toCharArray()

    if (cs1.size() != 0)
    {
        return 1
    }

    if (cs2[0] != 'A' || cs2[1] != 'a'||cs2[2]!='b'||cs2[3]!='c'||cs2[4]!='d')
    {
        return 1
    }
    if (cs3[0] != '1' || cs3[1] != '2'||cs3[2]!='3'||cs3[3]!='4'||cs3[4]!='5'||cs3[5]!='6')
    {
        return 1
    }
    if (cs4[0] != '仓' || cs4[1] != '颉'||cs4[2]!='桌'||cs4[3]!='子'||cs4[4]!='电'
    ||cs4[5]!='脑'||cs4[6]!='椅'||cs4[7]!='子')
    {
        return 1
    }
    if (cs5[0] != '\n' || cs5[1] != '\t'||cs5[2] != '\b'||cs5[3] != '\\')
    {
        return 1
    }
    if (cs6[0] != 'a' || cs6[1] != '1'||cs6[2] != '仓'||cs6[3] != '\n')
    {
        return 1
    }
    

return 0
}

func main(): Int64 {
    return run()
}

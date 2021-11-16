// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "hello char lang"
    var chs = ['h','e','l','l','o',' ','c','h','a','r',' ','l','a','n','g']
    var s2 = String(chs)
    var s3 = "hello char lang \u{5324}"
    var s4 = s1.substring(0, 5)

    var res1 = s1 != s2   //  false
    var res2 = s3 != "hello char lang \u{5324}"  //  false
    var res3 = "hello char lang \u{5324}" != s3  //  false
    var res4 = "hello" != s4  //  false
    var res5 = "" != String()   //  false
    var res6 = "  " != "  "   //  false
    var res7 = "a\n" != """
a
"""
    var res8 = "a\\n" != #"a\n"#

    if (res1 || res2 || res3 || res4 || res5 || res6 || res7 || res8){
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}

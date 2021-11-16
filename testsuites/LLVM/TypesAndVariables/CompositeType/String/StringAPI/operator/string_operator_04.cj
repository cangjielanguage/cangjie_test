// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
    var s1: String = "hello Char lang"
    var chs = ['h','e','l','l','o',' ','c','h','a','r',' ','l','a','n','g']
    var s2 = String(chs)
    var s3 = "hello Char lang"
    var s4 = s1.substring(0, 5)

    var i1: Int64 = 0
    var i2: Int64 = 2
    var i3: Int64 = 4
    var i4: Int64 = 14

    var res1 = s1.charAt(i1)
    var res2 = s2.charAt(i4)
    var res3 = s3.charAt(i3)
    var res4 = s4.charAt(i2)
    var res5 = "123".charAt(i2)

    if (res1 == 'h' && res2 == 'g' && res3 == 'o' && res4 == 'l' && res5 =='3'){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
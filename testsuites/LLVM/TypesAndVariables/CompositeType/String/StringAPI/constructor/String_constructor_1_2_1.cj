// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func run(): Int64 {
        
    //var c1: Array<Char> = @{''}
    var c2 : Array<Char> = Array<Char>(['A','a','B','b','f','F'])
    var c3 : Array<Char> = Array<Char>(['1','2','3','7','9'])
    var c4 : Array<Char> = Array<Char>(['仓','颉','编','程','语','言'])
    var c5 : Array<Char> = Array<Char>(['\n','\t','\b','\\'])
    var c6 : Array<Char> = Array<Char>(['仓','颉','b','f','F','3','7','9','\n','\t','\b','\\'])
    
    
    var s22: String =String(c2).substring(0,1)
    var s222: String = String(c2).substring(3,2)
    var s2222: String = String(c2).substring(6,0)
    
    var s33: String = String(c3).substring(0,1)
    var s333: String = String(c3).substring(3,2)
    var s3333: String = String(c3).substring(5,0)
    
    var s44: String = String(c4).substring(0,1)
    var s444: String = String(c4).substring(3,2)
    var s4444: String = String(c4).substring(6,0)
    
    var s55: String = String(c5).substring(0,1)
    var s555: String = String(c5).substring(2,2)
    var s5555: String = String(c5).substring(4,0)
    
    var s66: String = String(c6).substring(0,1)
    var s666: String = String(c6).substring(5,2)
    var s6666: String = String(c6).substring(12,0)

    if (s22 != "A" ||s222 != "bf" || s2222!="")        {
            return 1
        }
    if (!(s33=="1"&&s333=="79"&&s3333==""))        {
            return 1
        }
    if (!(s44=="仓"&&s444=="程语"&&s4444==""))        {
            return 1
        }
    if (!(s55=="\n"&&s555=="\b\\"&&s5555==""))        {
            return 1
        }
    if (!(s66=="仓"&&s666=="37"&&s6666==""))    {
        return 1
    }
        

return 0
}

func main(): Int64 {
    return run()
}
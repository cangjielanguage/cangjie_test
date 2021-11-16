// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var s1 = "abcb"
    var s2 = ""
    var r1 = s1.get(1)
    var r2 = s2.get(1)
    var r3 = "中国中".get(1)
    if ( foo(r1) != 'b' ){
        return 1
    }
    if ( foo(r2) != '1' ){
        return 2
    }
    if ( foo(r3) != '国' ){
        return 3
    }
    if ( foo("中国abc".get(8)) != '1' ){
        return 4
    }
    return 0
}

func foo(x:Option<Char>){
    var a = match(x){
        case Some(v) => v
        case None => '1'
    }
    return a
}

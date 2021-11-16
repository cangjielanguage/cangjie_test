// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var str1 = "abcb"
    var res1 = str1.indexOf("b")
    if ( foo(res1) != 1 ){
        return 1
    }
    var res2 = str1.indexOf("d")
    if ( foo(res2) != 1000 ){
        return 2
    }
    return 0
}

func foo(x:Option<Int64>){
    var a = match(x){
        case Some(v) => v
        case None => 1000
    }
    return a
}

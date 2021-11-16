// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var res1 = "abcb".lastIndexOf("b")
    var res2 = "abcb".lastIndexOf('b')
    if ( foo(res1) != 3 ){
        return 3
    }
    if ( foo(res2) != 3 ){
        return 3
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

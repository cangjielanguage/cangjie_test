// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var res3 = "".indexOf("a")
    if ( foo(res3) != 1000 ){
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

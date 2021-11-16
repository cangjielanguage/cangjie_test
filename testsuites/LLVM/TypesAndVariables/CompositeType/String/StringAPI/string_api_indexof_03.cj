// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var res3 = "bacb".indexOf("b",2)
    if ( foo(res3) != 3 ){
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

// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

//DTS2021091415941
func main(): Int64 {
    var str1 = "abc"
    var res3 = str1.indexOf("")
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

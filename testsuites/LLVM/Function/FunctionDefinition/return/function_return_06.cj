// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a = 0
    if (case01() == ()) {
        a++
    }
    if (case04(1,2) == ()) {
        a++
    }
    if ( a != 2 ) { return 1 }
    return 0
}

func case01():Unit{
    2
}
func case03(a: Int32, b: Int32):Unit{
    if (a>b){
        a
    }else{
        b
    }
}

func case04(a: Int32, b: Int32):Unit{
    if (a>b){
        a
    }else{
        b
    }
}



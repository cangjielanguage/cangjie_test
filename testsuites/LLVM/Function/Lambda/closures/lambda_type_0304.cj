// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != () ) {
        return 1
    }
    return 0
}

func case01():Unit{
    var a:Int32 = 1
    {x:Int32=> x + a}(1)
}

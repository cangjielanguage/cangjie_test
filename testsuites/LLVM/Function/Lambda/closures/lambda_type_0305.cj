// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01()(6) != () ) {
        return 1
    }
    return 0
}

func case01():(Int32)->Unit{
    let a:Int32 = 1
    {x:Int32=> x + a}
}

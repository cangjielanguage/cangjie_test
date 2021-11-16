// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != 1 ) {
        return 1
    }
    return 0
}

func foo01(x:()->Int32){return x()}
func case01(){
    return foo01({1})
}
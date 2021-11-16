// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( case01()[2][0] != 1  ) {
        return 1
    }
    if ( case02(1,2)[2][0] != 1  ) {
        return 2
    }
    return 0
}

func case01(){
    let a = (1,2,(1,2,3))
    return a
}
func case02(a: Int32,b: Int32): Int32*Int32*(Int32*Int32*Int32) {
    let a = (a,b,(a,b,a))
    return a
}
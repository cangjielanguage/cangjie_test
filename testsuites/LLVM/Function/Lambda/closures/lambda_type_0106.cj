// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != 1 ) {
        return 2
    }
    return 0
}

func case01(){
    var a: Int32 = 1
    var b: Int32 = {x:Int32=>x}(1)
    return b
}

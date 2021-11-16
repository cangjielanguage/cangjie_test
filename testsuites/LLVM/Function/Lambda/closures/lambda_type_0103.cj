// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case02() != 1 ) {
        return 2
    }
    return 0
}

func case02(){
    var a: Int64 = { 1 }()
    return a
}

func case03(){
    var a: Int64 = { => var x = 1;x }()
    return a
}

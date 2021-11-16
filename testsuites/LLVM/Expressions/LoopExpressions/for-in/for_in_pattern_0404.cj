// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != 2 ) {
        return 7
    }
    return 0
}

func case01(){
    let intList: List<(Int32*Int32)> = [(0,0), (1,1), (2,2)]
    var a: Int32 = 0
    for ((x,y) in intList) {
        a = x
    }
    a
}
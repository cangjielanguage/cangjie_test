// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01(1,2) != () ){
        return 1
    }
    if ( case02() != 0 ){
        return 1
    }
    if ( case03() != 0 ){
        return 1
    }
    return 0
}

func case01(a: Int32, b: Int32){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    for (item in intList) if ( item > 3 ) {
        item
    }
}

func case02(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 3
    var res = match ((a)) {
        case b => 0
        case _ => 1
    }
    res
}

func case03(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 3
    (a = 0)
    var res = match ((a)) {
        case b => (b)
        case _ => (1)
    }
    res
}

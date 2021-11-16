// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != 4 ) {
        return 3
    }
    if ( case02() != 2 ) {
        return 4
    }
    if ( case03() != 2 ) {
        return 5
    }
    if ( case04() != 2 ) {
        return 6
    }
    return 0
}



func case01(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    for (item@_ in intList) {
        a = item
    }
    a
}

func case02(){
    let intList: List<(Int32*Int32)> = [(0,0), (1,1), (2,2)]
    var a: Int32 = 0
    for (item@(_,_) in intList) {
        a = item[0]
    }
    a
}

func case03(){
    let intList: List<(Int32*Int32)> = [(0,0), (1,1), (2,2)]
    var a: Int32 = 0
    for (item@(x,y) in intList) {
        a = x
    }
    a
}

func case04(){
    let intList: List<(Int32*Int32)> = [(0,0), (1,1), (2,2)]
    var a: Int32 = 0
    var b: String = "Hello"
    for (item@(b,c) in intList) {
        a = b
    }
    a
}


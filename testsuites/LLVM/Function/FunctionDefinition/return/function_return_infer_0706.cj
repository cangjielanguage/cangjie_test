// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if (case01() != () || case01_01() != 4 ) {
        return 1
    }
    if (case02() != () || case02_01() != 4 ) {
        return 2
    }
    if (case03() != () || case03_01() != 4 ) {
        return 3
    }
    return 0
}

func case01(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    for (item in intList) if ( item > 3 ) {
        a = item
    }
}

func case01_01(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    for (item in intList) if ( item > 3 ) {
        a = item
    }
    a
}

func case02(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    while ( a < 4) {
        a++
        a
    }
}

func case02_01(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    while ( a < 4) {
        a++
        a
    }
    a
}

func case03(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    do {
        a++
        a
    } while ( a < 4 )
}

func case03_01(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    do {
        a++
        a
    } while ( a < 4 )
    a
}
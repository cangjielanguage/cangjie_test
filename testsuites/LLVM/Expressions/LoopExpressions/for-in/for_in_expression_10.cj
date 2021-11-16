// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case02() != 10 ) {
        return 1
    }
    if ( case03() != 10 ) {
        return 1
    }
    if ( case04() != 40 ) {
        return 1
    }
    return 0
}

//func case01(){
//    let arr = Array<Int64>([0, 1, 2, 3, 4])
//    var a: Int32 = 0
//    for (item in arr) {
//        print("${item}")
//    }
//    a
//}

func case02(){
    let arr =@{0, 1, 2, 3, 4}
    var a: Int64 = 0
    for (item in arr) {
        a = a + item
    }
    a
}

func case03(){
    let arr = Array<Int32>(5,2)
    var a: Int32 = 0
    for (item in arr) {
        a = a + item
    }
    a
}

func case04(){
    let arr = Array<Array<Int32>>(5,Array<Int32>(4,2))
    var a: Int32 = 0
    for (item in arr) {
        for (sub_item in item) {
                a = a + sub_item
                print(a.toString()+"\n")
            }
    }
    a
}

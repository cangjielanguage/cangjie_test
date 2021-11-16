// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( case01() != 10 ) {
        return 1
    }
    if ( case02() != 3 ) {
        return 2
    }
    if ( case03() != 21 ) {
        return 3
    }
    return 0
}

func case01(){
    let intSet = #{0, 1, 2, 3, 4}
    var a: Int64 = 0
    for (item in intSet) {
        a = a + item
    }
    a
}

func case02(){
    let intSet1 = #{0, 1, 2}
    let intSet = #{intSet1, intSet1,intSet1} // #{#{0,1,2}}
    var a: Int64 = 0
    for (item in intSet) {
        for (itemsub in item) {
            a = a + itemsub
        }
    }
    a
}

func case03(){
    let intSet1 = #{0, 1, 2}
    let intSet2 = #{3, 4, 5,6}
    let intSet3 = #{3, 4, 5,6}
    let intSet = #{intSet1, intSet2,intSet3} // {0,1,2,3,4,5,6}
    var a: Int64 = 0
    for (item in intSet) {
        for (itemsub in item) {
            a = a + itemsub
        }
    }
    a
}


